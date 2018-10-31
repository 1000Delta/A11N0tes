# shell 基本语法

## 控制结构

```shell
if Expression
then
Command
elif Expression
then
Command
else
Command
fi
```

条件表达式：

- 文件表达式

  Expression|Note
  ---|---
  `[ -f file ]`| 如果文件存在
  `[ -d ... ]`| 如果目录存在 
  `[ -s file ]`| 如果文件存在且非空 
  `[ -r file ]`| 如果文件存在且可读 
  `[ -w file ]`| 同上，可写 
  `[ -x file ]`| 同上，可执行 

- 整数变量表达式

  | Expression          | Note                    |
  | ------------------- | ----------------------- |
  | `[ int1 -eq int2 ]` | 如果 `int1` 等于 `int2` |
  | `[ int1 -ne int2 ]` | `!=`                    |
  | `[ int1 -ge int2 ]` | `>=`                    |
  | `[ int1 -gt int2 ]` | `>`, great than         |
  | `[ int1 -le int2 ]` | `<=`                    |
  | `[ int1 -lt int2 ]` | `<`, less than          |

- 字符串变量表达式

  | Expression       | Note                                                     |
  | ---------------- | -------------------------------------------------------- |
  | `[ $a = $b ]`    | 字符串`$a`等于字符串`$b`<br />字符串允许使用赋值号作等号 |
  | `[ $a != $b ]`   | `!=`                                                     |
  | `[ -n $string ]` | 非空（非0），返回0（true）                               |
  | `[ -z $string ]` | 如果 $string 为空则返回0                                 |
  | `[ $string ]`    | 同 `-n`                                                  |

## 循环结构

### for循环

for循环有三种结构：

- 列表for循环
- 不带列表for循环
- C风格for循环

#### 列表for循环

```bash
!/bin/bash

for var1 in {1..5}
do
	echo $var1
done
```



