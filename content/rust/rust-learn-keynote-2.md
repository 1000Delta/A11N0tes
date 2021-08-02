---
title: "Rust 学习笔记二 | enum & match"
date: 2021-07-27
lastmod: 2021-08-03
description: ""
tags: []
categories: []
# image: "/image/blog-pic.jpg"
---

- [enum](#enum)
  - [Option enum](#option-enum)
- [`match` expression](#match-expression)
  - [`if let` expression](#if-let-expression)

## enum

Enum 语法：

```rust
enum TestEnum {
  E1,
  E2,
}
```

枚举变量（enum variant），可以容纳变量，类似于 tuple struct

```rust
// 变量 Enum 可以用于容纳不同类型和数量的变量。
enum TestEnumVar {
  EV1(String),
  EV2(String),
  EV3(i32, i32),
  EV4(id: i32, name: String),
}
```

可以用于组织相关联但是包含变量的数据，举例 HTTP Method:

```rust
enum HTTPMethod {
  GET(url: String, query: String),
  POST(url: String, query: String, body: String),
  // ... more method
}
```

*The Rust Programming Language* 也提到：

> 使用变量 enum 和定义不同种类的 struct 很相似，除了 enum 不使用 `struct` 关键字，
> 并且所有的变量都组织在同一个类型下。

### Option enum

类似于其他语言中的 null，支持泛型。

使用 `Some(T)` 和 `None` 两个 enum 值标识结果是否有效

```rust
let some_value: i32 = 1;

// s 为 Option<i32> 类型
let s = Some(some_value);
// 指定 Option 变量为 None 时，需要指定泛型的类型
let n: Option<i32> = None;
```

## `match` expression

`match` 表达式类似于其他语言的 `switch`，可以用于对变量进行模式匹配，然后执行对应的**表达式**：

```rust
enum TestMatchEnum {
  Test,
  TestVariant(i32),
}

fn get_order_or_value(v: TestMatchEnum) -> i32 {
  match v {
    TestMatchEnum::Test => {
      println!("用花括号表达式（代码块）可以执行多个语句，并以最后一个表达式（不能是语句）为返回值");
      0
    },
    // match 表达式也用于从枚举变量中获取值
    TestMatchEnum::TestVariant(value) => value,
    // 不仅可以提取值，也可以用于匹配特殊值
    TestMatchEnum
  }
}

// 用于处理 Option<T> 时，可以方便地仅在满足 Some 或者 None 时执行操作
fn option_i32_increase(var: Option<i32>) -> Option<i32> {
  match var {
    // 从匹配的 Some 中提取值 i，然后创建一个值为 i+1 的 Some 并返回
    Some(i) => Some(i+1),
    None => None
  }
}
```

`match` 表达式需要对所有可能的值提供处置，否则编译时就会报错。

对于处理多个可能的值时，我们可以使用占位符 `_`，任何**没有匹配到我们指定模式**的值都会执行占位符对应的代码：

```rust
fn print_weekday_str(week_num: i32) {
  match week_num {
    1 => println!("Monday"),
    2 => println!("Tuesday"),
    3 => println!("Wednesday"),
    4 => println!("Thursday"),
    5 => println!("Friday"),
    // () 表示空元组，即没有任何值
    _ => (),
  }
}
```

### `if let` expression

用于简化仅需要匹配单个模式的 `match` 表达式，不符合模式的结果将会被忽略。

```rust
let v = Some(2)
// 用于匹配单个值
if let Some(2) = v {
  println!("best match!");
}
// 也可以用于提取变量枚举的特殊变量的值
if let Some(v_in) = v {
  println!("v in enum = {}", v_in); // v in enum = 2
}
```
