---
title: "Go map 如何使用哈希值来寻址"
date: 2020-08-21T01:46:44Z
description: ""
tags: [golang, hash]
categories: [golang]
---

## 基本概念

### 哈希表

哈希表用于保存键值对，通过哈希函数对键进行哈希之后，根据哈希值和表的大小求出存储值的位置。

#### 哈希冲突

由于哈希函数的选择，对于不同的键可能会出现哈希值相同的结果，而因为键不同不能对值进行覆盖，此时需要通过一些方式解决哈希冲突，常用方法包括分离链接法和开地寻

址法。

##### 分离链接法

也称为拉链法，这种哈希表的结构，每个哈希值对应的位置都是一个链表，称为桶（bucket），对于哈希值相同的键值对，首先查询到桶的位置，然后遍历链表找到值相等的元素。

对于这种方法，如果桶容纳的元素过多，查找速度就会大幅下降。比如同样是 10000 个元素，平均分布在 1000 个桶里的查找速度是 10000 个桶的 1/10，但是即使如此查找速度也是线性表的 1000 倍。

##### 开放地址法

开放地址法是指对于产生哈希冲突的键值对，我们要通过二次甚至多次的计算来得到一个新的位置存储键值对，对于表的大小要求比拉链法要高。

一般的公式为

$$
h_i(X) = (Hash(X) + F(i)) \mod TableSize
$$

- $X$ 键
- $i$ 多次探查的次数
- $Hash(x)$ 哈希函数
- $F(i)$ 探查函数，与寻址次数相关

常用的选择探查函数的方法有：

- 线性探查法
- 平方探查法
- 双散列

## Go map 的实现

Go map 采用了哈希表的方法来实现，并且采用拉链法解决冲突问题。

哈希表的结构采用 [`runtime.hmap`](https://github.com/golang/go/blob/36f30ba289e31df033d100b2adb4eaf557f05a34/src/runtime/map.go#L115-L129) 表示，表中的每个位置，也就是哈希桶采用 [`runtime.bmap`](https://github.com/golang/go/blob/36f30ba289e31df033d100b2adb4eaf557f05a34/src/runtime/map.go#L149-L159) 来表示。

对于 map 的详细介绍，可以去参考 draven 的文章 [Go 语言设计与实现 - 3.3 哈希表](https://draveness.me/golang/docs/part2-foundation/ch03-datastructure/golang-hashmap/)

我们重点关注在哈希表中的几个字段：

[`hmap.B`](https://github.com/golang/go/blob/36f30ba289e31df033d100b2adb4eaf557f05a34/src/runtime/map.go#L120)

这个字段表示的是 map 的大小，存储的是对数值，因为 map 的大小是按照二的倍数扩容的，即 $cap = 2^B$

[`bmap.tophash`](https://github.com/golang/go/blob/36f30ba289e31df033d100b2adb4eaf557f05a34/src/runtime/map.go#L120)

这个字段用于标记哈希桶中存储元素 hash 的高 8 位，在没有元素时存储的是可能的[标志值](https://github.com/golang/go/blob/36f30ba289e31df033d100b2adb4eaf557f05a34/src/runtime/map.go#L92-L96)，用于表示桶或者位置的状态，对于 hash 小于 `minTopHash` 的哈希值，会加上 `minTopHash` 再存入 `tophash`。

那么 `tophash` 对于 map 查找元素究竟有什么用？

### Go map 如何进行寻址

我们参考 [`runtime.mapaccess1`](https://github.com/golang/go/blob/36f30ba289e31df033d100b2adb4eaf557f05a34/src/runtime/map.go#L394-L450)，在访问 map 元素时就会使用这个函数（不使用 ok 断言），我们看它计算 hash 和查找元素的过程：

```go
hash := t.hasher(key, uintptr(h.hash0))
m := bucketMask(h.B)
b := (*bmap)(add(h.buckets, (hash&m)*uintptr(t.bucketsize)))
```

这部分代码进行了 hash 运算和查找哈希桶的过程，通过 `runtime.bucketMask` 求出蒙版范围，然后对 hash 值截断，根据在表大小范围内的后 $2^B$ 位来选择桶。

通过 [`runtime.bucketmask`](https://github.com/golang/go/blob/36f30ba289e31df033d100b2adb4eaf557f05a34/src/runtime/map.go#L182-L191) 的源码我们可以了解到，它是通过把在 `hmap.B` 范围内的位置 1 来得到蒙版值。

同时这段也解释了为什么使用 `bmap.tophash` 可以区分同一个桶中的元素，因为在选择桶时不会参考高位，因此高位具有随机性。

接下来看如何寻找元素位置：

```go
	top := tophash(hash)
bucketloop:
	for ; b != nil; b = b.overflow(t) {
		for i := uintptr(0); i < bucketCnt; i++ {
			if b.tophash[i] != top {
				if b.tophash[i] == emptyRest {
					break bucketloop
				}
				continue
			}
			k := add(unsafe.Pointer(b), dataOffset+i*uintptr(t.keysize))
			if t.indirectkey() {
				k = *((*unsafe.Pointer)(k))
			}
			if t.key.equal(key, k) {
				e := add(unsafe.Pointer(b), dataOffset+bucketCnt*uintptr(t.keysize)+i*uintptr(t.elemsize))
				if t.indirectelem() {
					e = *((*unsafe.Pointer)(e))
				}
				return e
			}
		}
  }
  return unsafe.Pointer(&zeroVal[0])
```

首先使用 [`runtime.tophash`](https://github.com/golang/go/blob/36f30ba289e31df033d100b2adb4eaf557f05a34/src/runtime/map.go#L193-L200) 计算 hash 的高 8 位，并且会对结果进行判断：

```go
	if top < minTopHash {
		top += minTopHash
  }
```

即排除掉标志值。

然后通过两层 `for` 循环，外层遍历当前桶和它的溢出桶（溢出桶机制可以参考 [Go 语言设计与实现 - 3.3 哈希表 - 2 数据结构](https://draveness.me/golang/docs/part2-foundation/ch03-datastructure/golang-hashmap/#332-%E6%95%B0%E6%8D%AE%E7%BB%93%E6%9E%84)），内层的 `for` 循环先检查当前位置的 `tophash`，通过标志数值可以判断桶是否为空，如果为空直接跳出所有循环返回零值，`tophash` 不匹配则进入下一次循环；`tophash` 匹配时才会对判断 key 是否匹配，并且还需要通过 `t.indirectkey` 检查键是否为引用。

#### `t.indirectkey` 如何工作？

我们先查看 [`t.indirectkey`](https://github.com/golang/go/blob/36f30ba289e31df033d100b2adb4eaf557f05a34/src/runtime/type.go#L378-L380)，这个方法通过位运算输出了 `t.flags` 的第一位，根据注释的提示我们去找到对应 [flag](https://github.com/golang/go/blob/36f30ba289e31df033d100b2adb4eaf557f05a34/src/cmd/compile/internal/gc/reflect.go#L1319-L1322) 的含义。

```go
if t.Key().Width > MAXKEYSIZE {
  ot = duint8(lsym, ot, uint8(Widthptr))
  flags |= 1 // indirect key
}
```

代码对键类型的大小判断，大于 `MAXKEYSIZE` 时就会使用引用存储键，并标志为 indirect key。

## 总结

Go map 通过哈希表来实现，采用拉链法进行冲突解决。具体到寻址则是利用低位进行桶的选择，然后遍历桶进行键的查找，利用 hash 的高 8 位进行预匹配，加速了键的查找，并且利用标志位进一步减少多余操作。
