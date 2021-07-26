---
title: "Grok filter 插件"
date: 2020-07-14T08:43:12Z
description: ""
tags:
  - "翻译"
  - "Logstash"
categories:
  - "Logstash"
section: "Logstash 文档翻译"
---

- 插件版本：v4.3.0
- 发布于：2020-02-21
- [更新日志](https://github.com/logstash-plugins/logstash-filter-grok/blob/v4.3.0/CHANGELOG.md)

对于其他版本，请查看 [版本插件文档](https://www.elastic.co/guide/en/logstash-versioned-plugins/current/filter-grok-index.html)。

## 求助

与插件有关的问题，请在论坛 [Discuss](http://discuss.elastic.co/) 开启一个主题。对于 bug 和新特性的请求，请在 [Github](https://github.com/logstash-plugins/logstash-filter-grok) 开启一个 issue。对于 Elastic 支持的插件列表，请参考 [Elastic Support Matrix](https://www.elastic.co/support/matrix#matrix_logstash_plugins).

## 介绍

用于解析任意字符串并将其结构化。

Grok 是一个用于将非结构化解析成结构化并且可查询的日志数据的好方法。

这个工具对于 syslog 日志、apache 日志和其他服务器日志、mysql 日志和一般情况下任何通常来说写给人类而不是计算机消费的日志格式非常棒。

Logstash 默认情况下附带了 120 中模式。你可以在 https://github.com/logstash-plugins/logstash-patterns-core/tree/master/patterns 中找到它们。你也可以普通地自己添加。 (查阅 `patterns_dir` 设置)

如果你需要帮助来构建模式去匹配你的日志，你会发现 http://grokdebug.herokuapp.com/ 和 http://grokconstructor.appspot.com/ 应用非常有用！

## Grok 还是 Dissect？或者都用？

[`dissect`](https://www.elastic.co/guide/en/logstash/7.8/plugins-filters-dissect.html) 过滤器插件是使用分隔符来提取非结构化事件数据到字段的另一种方式。

Dissects 和 Grok 不同在于它不使用正则表达式并且更快。Dissect 在数据可靠重复的情况下工作地更好，当你的文本结构在多行之间变化时 Grok 是一个更好的选择。

当连续多行的数据稳定重复，而整个行不是这样的情况下，你可以混合使用 Dissect 和 Grok。Dissect 过滤器能解构连续多行的重复数据。Grok 过滤器可以处理其余的更能被正则所表示的字段和值。

## Grok 基础

Grok 的工作原理是组合模式到一些东西中来匹配你的日志。

一个 grok pattern 的语法是 `%{SYNTAX:SEMATIC}`

`SYNTAX` 是将要匹配你的文本的模式的名字。例如，`3.44` 将被 `NUMBER` 模式匹配，而 `55.3.244.1` 将会被 `IP` 模式匹配，`SYNTAX` 表明如何去匹配内容。

`SEMANTIC` 是你提供的被匹配内容的标识符。例如，`3.44` 可以表示事件的持续时间，因此可以简单的叫做 `duration`。进一步，一个字符串 `55.3.244.1` 可能表示发起请求的客户端 `client`.

对于上述例子，你的 Grok 过滤器将看起来像这样：

```
%{NUMBER:duration} %{IP:client}
```

可选地你可以添加数据类型转换到你的 grok 模式中。默认所有的语义都保存为字符串。如果你希望转换一个语义的数据类型，例如转换一个字符串到整数，就添加目标数据类型的后缀。举例，`%{NUMBER:num:int}` 用于转换 `num` 语义从字符串到整数。现在支持的转换只有 `int` 和 `float`。

**Examples:** 随着语法和语义的这一想法，我们可以从一个样本记录这样虚构的 HTTP 请求日志中提取出有用的字段：

```
55.3.244.1 GET /index.html 15824 0.043
```

对于这个的模式可以是:

```
%{IP:client} %{WORD:method} %{URIPATHPARAM:request} %{NUMBER:bytes} %{NUMBER:duration}
```

一个更实际的例子，让我们从文件中读取这些记录：

```ruby
input {
    file {
        path => "/var/log/http.log"
        }
    }
filter {
    grok {
        match => { "message" => "%{IP:client} %{WORD:method} %{URIPATHPARAM:request} %{NUMBER:bytes} %{NUMBER:duration}" }
        }
    }
```

经过 grok 过滤器之后，事件将会有一些额外的字段在其中:

- `client: 55.3.244.1`
- `method: GET`
- `request: /index.html`
- `bytes: 15824`
- `duration: 0.043`

## 正则表达式

Grok 无比支持正则表达式，所以任何正则表达式在 Grok 中同样有效。使用的正则表达式库是 Oniguruma，并且你可以在 [Oniguruma 网站](https://github.com/kkos/oniguruma/blob/master/doc/RE) 中看到正则语法的完全支持。

## 定制模式

有时候 Logstash 并没有你需要的模式，对此，你有一些选项。

首先，你可以使用 Oniguruma 语法来使用命名捕获组来将匹配到的文本保存成一个字段：

```
(?<field_name>the pattern here)
```

例如，postfix 日志有一个 10 到 11 个字符的十六进制值的 `queue id`。我可以这样简单地捕获：

```
(?<queue_id>[0-9A-F]{10,11})
```

作为替代，你可以创建一个定制模式文件。

- 创建一个 `patterns` 目录和其中的一个 `extra` 文件（这个文件名不重要，但是名字对于你自己有意义）
- 在文件中，按照模式名，空格，正则的形式写下你需要的模式。
