# elasticsearch RESTful API

> 所有语言都可以使用RESTful API 通过 port 9200 与 Elasticsearch 进行通信。

## 格式

curl:

```bash
curl -X<VERB> '<PROTOCAL>://<HOST>:<PORT>/<PATH>?<QUERY_STRING>' -d '<BODY>'
```

| `VERB`         | 适当的 HTTP *方法* 或 *谓词* : `GET`、 `POST`、 `PUT`、 `HEAD` 或者 `DELETE`。 |
| -------------- | ------------------------------------------------------------ |
| `PROTOCOL`     | `http` 或者 `https`（如果你在 Elasticsearch 前面有一个 `https` 代理） |
| `HOST`         | Elasticsearch 集群中任意节点的主机名，或者用 `localhost` 代表本地机器上的节点。 |
| `PORT`         | 运行 Elasticsearch HTTP 服务的端口号，默认是 `9200` 。       |
| `PATH`         | API 的终端路径（例如 `_count` 将返回集群中文档数量）。Path 可能包含多个组件，例如：`_cluster/stats` 和 `_nodes/stats/jvm` 。 |
| `QUERY_STRING` | 任意可选的查询字符串参数 (例如 `?pretty` 将格式化地输出 JSON 返回值，使其更容易阅读) |
| `BODY`         | 一个 JSON 格式的请求体 (如果请求需要的话)                    |

## 实例

### 添加文档

---

```
PUT /index/type/id
{
    "key": "value"
}
```

**路径**包含三部分信息：

`index` 索引库名称

`employee` 类型名称

`id` 主键（id）

其后跟随的是数据的JSON键值对



### 计算文档的数量

------

```
GET /index/type/_count
```

返回值中`count`字段表示查询到的数量

### 检索文档

---

#### 检索单个数据

```
GET /index/type/id
```

返回结果包含文档的一些元数据，以及`_source`属性，内容是存入的原始JSON文档

#### 轻量搜索

```
GET /index/type/_search
```

返回结果包括分类内查询到的文档，放在数组`hits`中，**一个搜索默认返回十条结果**。

#### 轻量搜索 - 查询字符串搜索

```
GET /index/type/_search?q=key:val
```

#### 查询表达式搜索

```
GET /index/type/_search
{
    "query": {
        "match": {
            "key": "val"
        }
    }
}
```

在其中使用JSON构造，并使用了一个`match`查询

#### 全文搜索

```
GET /index/type/_search
{
    "query": {
        "match": {
            "key": "word1 word2"
        }
    }
}
```

通过在匹配值中使用多个单词进行匹配，搜索结果将会根据**匹配单词结果顺序**进行**相关性判定**并**将相关性大于0的对象按照相关性得分降序排序**



## JSON关键字

- `query` 查询主结构
  - `bool`
  - `must`
  - `match` 匹配器
  - `filter` 过滤器
    - `gt` 表示 *大于（great than）*
    - 

