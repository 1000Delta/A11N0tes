---
title: 'Rust 学习笔记'
date: 2021-06-03
lastmod: 2021-06-09
description: ''
tags: [rust, learn]
categories: [rust]
# image: "/image/blog-pic.jpg"
---

- [Install Rust Language Server for Neovim](#install-rust-language-server-for-neovim)
  - [21/06/06 使用 rust-analyzer 替换 rls](#210606-使用-rust-analyzer-替换-rls)
- [Dependency Management in Rust](#dependency-management-in-rust)
- [statement and expression](#statement-and-expression)
  - [expression - 表达式](#expression---表达式)
  - [statement - 语句](#statement---语句)
- [Ownership](#ownership)
  - [Copy and Move](#copy-and-move)

## Install Rust Language Server for Neovim

lsp 是啥就不介绍了，服务器使用 rust 官方的 [rls](https://github.com/rust-lang/rls)，neovim 接入 Lang Server 的插件选用 [vim-lsp](https://github.com/prabirshrestha/vim-lsp).

教程如下：

- [安装 rls](https://github.com/rust-lang/rls#setup)
- [安装 vim-lsp](https://github.com/prabirshrestha/vim-lsp#installing)

依赖还有 vim-plug 等，自行了解安装即可。

使用 rls 要注意需要在 rust 项目的路径或子路径使用 nvim 打开 rust 代码文件，否则 rls 会检测不到 Cargo.toml 无法使用。

如果不是按照 vim-lsp 中使用 asyncomplete 作为自动补全工具，而是像我一样使用了 coc.nvim 作为自动补全，可以通过配置 coc.nvim 的 coc-settings.json 指定 lang server 来使用自动补全，教程如下：

- [coc-settings.json - Rust](https://github.com/neoclide/coc.nvim/wiki/Language-servers#rust)

使用 rls 时需要手动定制，将配置中 `command` rust-analyzer 替换成 rls。

### 21/06/06 使用 rust-analyzer 替换 rls

由于 rls 补全效果感人，在我实际使用中对于类型方法不能自动补全，比如 `Range::rev()` 就不会提示，因此尝试切换到 rust-analyzer 进行使用，这里需要替换二者：vim-lsp 的代码检查和 coc.nvim 的补全提示。

当前 rustup toolchain 仅提供 nightly 版本，我们首先通过官方文档中的命令安装：

[官方文档](https://rust-analyzer.github.io/manual.html#rustup)

```bash
$ rustup +nightly component add rust-analyzer-preview
```

然后对 vim-lsp 进行配置，此处我们替换运行命令到 rust-analyzer：

```vim
" 启动 rust-analyzer 弃用 RLS
" 21/06/06 仅 nightly 提供
if executable('rust-analyzer')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rust-analyzer',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rust-analyzer']},
        \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
        \ 'whitelist': ['rust'],
        \ })
endif
```

主要是替换 `cmd` 的内容为 nightly toolchain 的 rust-analyzer.

---

coc.nvim 配置 rust-analyzer，经过测试，不能将手动配置的 `coc-settings.json` 中的 `command` 替换成 `rustup run nightly rust-analyzer` 命令，因此这里我们直接使用 coc 官方提供的插件 `coc-rust-analyzer` 即可：

- [coc-rust-analyzer -- Install](https://github.com/fannheyward/coc-rust-analyzer#install)

如果安装的 coc.nvim 版本过低，安装插件会报错，此时先更新 coc.nvim 即可，vim-plug 更新 coc.nvim 请运行 `:PlugUpdate coc.nvim` 或者不指定名称全局更新。

此时重新打开 rust 代码文件即可正常使用代码检查和自动补全功能，并且 rust-analyzer 对于类型方法可以正常补全，通过 (`.`) 即可触发。

## Dependency Management in Rust

Cargo 使用 [Semantic Versioning](http://semver.org/) 作为版本号标准，并且在 dependency 中无前缀版本号表示的是不改变子版本，即 `0.8.3` 表示 `0.8.3` 直到 `0.9.0` 之前的版本，等同于 `^0.8.3`.

## statement and expression

### expression - 表达式

- `{}` 代码块（block），代码块的最后一个表达式将作为返回值，如果没有则会返回一个空的元组（tuple）
- `if`
  - 可以将 `if` 表达式用在赋值语句中，类似三元运算符：`x = if condition {5} else {6}`
- `loop`

### statement - 语句

在 Rust 中，语句没有返回值，因此不能作为另一个语句的部分。

- `let`
- 任何表达式加上后缀分号（`;`）

## Ownership

### Copy and Move

Rust 有两种数据分配（data assigning）的行为，复制和移动。

> 数据分配的行为：
>
> - 将变量赋值到另一个变量
> - 作为参数传入函数
> - 作为返回值返回

对于派生了 `Copy` Trait 的类型，对于数据的分配会进行值的复制。

- 完全在栈上的数据类型（Stack-Only Data）可以对 `Copy` 进行派生；
- 所有简单类型和简单类型构成的元组都已经派生了 `Copy` Trait。

对于派生了 `Drop` Trait 的类型，任何数据分配都会进行值的移动（所有权移交）。

- 移动之前持有数据的变量将会失效；
- 任何派生了 `Drop` 的类型不能同时派生 `Copy`。
