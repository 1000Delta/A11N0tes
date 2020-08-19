---
title: "Golang 如何操作共享内存"
date: 2020-08-18T10:21:21Z
description: ""
tags: ["golang", "共享内存"]
categories: ["golang"]
---

共享内存是作为进程间通信的一种基本手段，在操作系统中提供了相关的系统调用。

参考资料：

> [Linux 下进程间通信方式——共享内存](https://www.cnblogs.com/wuyepeng/p/9748889.html) 介绍了共享内存的定义和 Linux 下相关的系统调用。
>
> [Golang 直接操作共享内存](https://www.sohu.com/a/154174156_99930294) 讲了 Golang 操作共享内存的基本方式，通过 `syscall.Syscall` 结合相应的中断号等参数来调用。
