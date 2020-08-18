# Logstash 学习记录

>  参考资料：
>
> [一文快速上手Logstash](https://cloud.tencent.com/developer/article/1353068)

## Logstash 基本架构

INPUTS

FILTERS

OUTPUTS

## 安装

通过 Docker 运行：

```shell
docker pull docker.elastic.co/logstash/logstash:7.8.0
```

## 基本运行

先了解 Docker 下 Logstash 的配置情况：

- 工作目录：`/usr/share/logstash/`
  - 配置文件：`config/`
  - Pipeline 目录：`pipeline/`

详细架构：

```
drwxrwsr-x 2 logstash root       4096 Jun 14 21:39 bin
drwxrwsr-x 1 logstash root       4096 Jun 14 21:40 config
-rw-rw-r-- 1 logstash root       2276 Jun 14 21:28 CONTRIBUTORS
drwxrwsr-x 1 logstash root       4096 Jul 13 06:14 data
-rw-rw-r-- 1 logstash root       4041 Jun 14 21:30 Gemfile
-rw-rw-r-- 1 logstash root      22666 Jun 14 21:31 Gemfile.lock
drwxrwsr-x 6 logstash root       4096 Jun 14 21:39 lib
-rw-rw-r-- 1 logstash root      13675 Jun 14 21:28 LICENSE.txt
drwxrwsr-x 4 logstash root       4096 Jun 14 21:39 logstash-core
drwxrwsr-x 3 logstash root       4096 Jun 14 21:39 logstash-core-plugin-api
drwxrwsr-x 4 logstash root       4096 Jun 14 21:39 modules
-rw-rw-r-- 1 logstash root     601073 Jun 14 21:28 NOTICE.TXT
drwxr-sr-x 2 logstash logstash   4096 Jun 14 21:40 pipeline
drwxrwsr-x 3 logstash root       4096 Jun 14 21:39 tools
drwxrwsr-x 4 logstash root       4096 Jun 14 21:39 vendor
drwxrwsr-x 9 logstash root       4096 Jun 14 21:39 x-pack
```

首先创建一个临时容器，将需要的配置文件拷贝出来：

```shell
#!/bin/sh
# 创建临时容器
docker run -itd --rm --name test-logstash docker.elastic.co/logstash/logstash:7.8.0
# 拷贝配置文件
mkdir test-logstash
docker cp docker cp test-logstash:/usr/share/logstash/pipeline ./test-logstash/pipeline
# 启动容器并映射配置文件
docker run -it --name test-logstash -v $(pwd)/test-logstash/pipeline/:/usr/share/logstash/pipeline/ docker.elastic.co/logstash/logstash:7.8.0
```

此处没有拷贝 `config/` 目录修改配置，只拷贝 `pipeline/ ` 修改相关通道、

启动容器之后就会运行 `pipeline/logstash.conf` 中指定的通道了。

## 配置 Logstash

此处主要讲 pipeline 相关的配置，如何指定输入、处理和输出。

> 参考资料：
>
> [Logstash Reference [7.8]](https://www.elastic.co/guide/en/logstash/current/index.html) » [Configuring Logstash](https://www.elastic.co/guide/en/logstash/current/configuration.html)



配置文件结构：

```
# 注释，用于描述配置文件的一部分
input {
	...
}
filter {
	...
}
output {
	...
}
```

###  [插件配置](https://www.elastic.co/guide/en/logstash/current/configuration-file-structure.html#plugin_configuration)

- [INPUT 插件](https://www.elastic.co/guide/en/logstash/current/input-plugins.html)
- [OUTPUT 插件](https://www.elastic.co/guide/en/logstash/current/output-plugins.html#output-plugins)
- [FILTER 插件](https://www.elastic.co/guide/en/logstash/current/filter-plugins.html#filter-plugins)
- [CODEC 插件](https://www.elastic.co/guide/en/logstash/current/codec-plugins.html#codec-plugins)

```
input {
	file {
		path => ""
		type => ""
	}
}
```

### [值类型](https://www.elastic.co/guide/en/logstash/current/configuration-file-structure.html#plugin-value-types)

插件需要值是一个确定的类型，下面会列出支持的值类型：

#### Array

数组类型

现在更多情况下被弃用，由于使用标准类型比如 `string` 通过插件定义 `:list => true` 属性可以提供更好的类型检查。但是仍然需要在不希望使用类型检查的地方用于处理 hash 的列表或者混合类型（渣翻

Example：

```
users => [ {id => 1, name => bob}, {id => 2, name => jane} ]
```

#### Lists

其本身不是一个类型，但是可以作为一个属性的类型。这让类型检查多个值成为可能。插件作者在定义一个参数的时候，可以通过标记 `:list => true` 允许 list 检查

Example:

```
 path => [ "/var/log/messages", "/var/log/*.log" ]
 uris => [ "http://elastic.co", "http://example.net" ]
```

#### Boolean

布尔类型

Example:

```
ssl_enable => true
```

#### Bytes

字节字段是表达一个有效的字节单位的字符串，它是一个方便地在你的插件选项中定义特殊大小的方式。

支持单位：

- SI （K M G T P E Z Y）base-1000
- Binary (Ki Mi Gi Ti Ei Zi Yi) base-1024

这个字段大小写不敏感并且允许在数值和单位之间有空格。

如果没有特别说明单位，整数字符串表示字节数。

Examples: 

```
  my_bytes => "1113"   # 1113 bytes
  my_bytes => "10MiB"  # 10485760 bytes
  my_bytes => "100kib" # 102400 bytes
  my_bytes => "180 mb" # 180000000 bytes
```

#### Codec

一个 Codec 是一个用于表示数据的 Logstash 编解码器（Codec）的名字。编解码器可以同时用于 inputs 和 outputs。

Input codecs 提供一个方便的方法用于在你的数据进入 input 之前进行解码。

Output codecs 提供一个方便的方式用于在你的数据从 output 离开之前编码。

使用一个 input 或者 output 编解码器可以消除在你的 Logstash pipeline 中使用单独的 filter 的需求。

Example:

```
  codec => "json"
```

#### Hash

一个哈希是一个键值对的集合，由格式 `"field1" => "field2"` 指明。

记住，多个键值对使用空格（或者换行）分割而不是逗号。

Example:

```
match => {
  "field1" => "value1"
  "field2" => "value2"
  ...
}
# or as a single line. No commas between entries:
match => { "field1" => "value1" "field2" => "value2" }
```

#### Number

数值类型必须是一个有效的数字值（浮点数或整数）

#### Password

密码类型是一个不会被记录或输出的字符串值。

#### URI

一个 URI 可以是从完整的 URL 像是 `http://elastic.co` 到一个简单的标识符像是 `foobar`。

如果 URI 包含一个密码，比如 `http://user:pass@example.net` ，URI 中的密码部分不会被记录或输出。

Example:

```
  my_uri => "http://foo:bar@example.net"
```

#### Path

path 值是一个用于表示有效的操作系统路径的字符串。

Example:

```
  my_path => "/tmp/logstash"
```

#### String

字符串必须是一个单字符序列。

记住字符串必须被引号包围，不管是单引号还是双引号。

#### Escape Sequences 转义序列

默认情况下，转义序列没有启用。如果你希望在被引的字符串中使用，你需要在 `logstash.yml` 中设置 `config.support_escapes: true` 。

[具体含义](https://www.elastic.co/guide/en/logstash/current/configuration-file-structure.html#_escape_sequences)

#### Comments

注释，使用 `#` 开始，可以在行末使用。

### 常用插件

基本插件不会赘述，主要是功能性比较强的插件会做一些说明。

#### file 输入

有 tail 和 read 两种模式

#### [grok 过滤器](https://www.elastic.co/guide/en/logstash/current/plugins-filters-grok.html#plugins-filters-grok)

通过正则和类型等方式处理数据

文档翻译：[地址](#)

和 Grok 过滤器类似但是更简单的是 Dissect 过滤器，不使用正则而速度更快。

#### [dissect 过滤器](https://www.elastic.co/guide/en/logstash/7.8/plugins-filters-dissect.html#plugins-filters-dissect)

通过简单的界定符和分隔符就可以对每行数据进行处理，适用于重复数据的处理。

## 实战

### 处理 nginx 输出日志

我们按照 Logstash 管道的工作原理进行划分，输入 -> 过滤 -> 输出

#### 输入 input

nginx 日志分为 `access_log` 和 `error_log` ，在配置文件中可以设置，一般是输出到 `.log` 文件，因此我们采用 [`input file`](https://www.elastic.co/guide/en/logstash/current/plugins-inputs-file.html) 进行日志读取。

file 读取分为两种模式，`read` 和 `tail` ，`read` 模式下，Logstash 不会跟踪文件的输入，因此我们采用 `tail` 模式；由于我们初始化之前已经存在日志，因此我们设置 `start_position=beginning` ，可以从头读取文件然后跟踪新输入。

大致 pipeline input 配置如下：

```
input {
  file {
    type => "nginx"
    path => "/file/access.log"
    mode => "tail" # 跟踪文件
    start_position => "beginning" # 读取旧日志
  }
}
```

#### 过滤 filter

过滤器使用 [grok](https://www.elastic.co/guide/en/logstash/current/plugins-filters-grok.html) 或者 [dissect](https://www.elastic.co/guide/en/logstash/7.8/plugins-filters-dissect.html) 都可以，它们都是为了将文本结构化而存在的，dissect 使用更加简单，只需要对字段域进行划分即可。而我们这里使用 grok，原因在于 grok 官方文档的默认模式中有 httpd 格式，正是 nginx 日志采用的格式，可以清晰的将日志结构化成字段来处理。

后续略，项目中没有使用 Logstash，使用 filebeat 替代。