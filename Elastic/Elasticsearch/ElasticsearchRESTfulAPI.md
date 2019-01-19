# elasticsearch RESTful API

> 所有语言都可以使用RESTful API 通过 port 9200 与 Elasticsearch 进行通信。

## 格式

curl:5

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

### 文档

#### 分析文档

对指定文档进行聚合分析，基于数据生成一些精细的分析结果。

例：

```
GET /megacorp/employee/_search
{
  "aggs": {
    "all_interests": {
      "terms": { "field": "interests" }
    }
  }
}
```

使用过程中可能会提示`Illegal_argument_exception`，对此有两种解决方案：

1. 修改mapping

   针对文本字段需要设置`fielddata`值为`true`，示例如下：

   ```
   PUT /megacorp/employee/_mapping/
   {
     "properties": {
       "interests": {
         "type": "text", 
         "fielddata": true
       }
     }
   }
   ```

2. 使用字段的`.keyword`子域

   ```
   GET /megacorp/employee/_search
   {
     "aggs": {
       "all_interests": {
         "terms": { "field": "interests.keyword" }
       }
     }
   }
   ```

#### 添加文档

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

#### 计算文档的数量

```
GET /index/type/_count
```

返回值中`count`字段表示查询到的数量

### 搜索

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

#### 高亮搜索片段

```
GET /index/type/_search
{
    "query": {
        "match": {
            "key": "w1, w2"
        }
    },
    "highlight": {
        "fields": {
        	"key": {}            
        }
    }
}
```

`highlight`字段中指定的key在搜索结果中将会被高亮

### 集群

#### 集群健康

```
GET /_cluster/health
```

返回值中包括字段：

- `status` 集群健康
  - `green` 所有**主分片**和**副本分片**都正常运行
  - `yellow` 所有**主分片**都正常运行，但不是所有的**副本分片**都正常运行
  - `red` 有**主分片**没能正常运行	

#### 强制段合并

使用 optimize API

可以看做 *强制合并API* ，它会将一个分片强制合并到`max_num_segments` 参数制定大小的段数目。这样做的意图是减少段的数量（通常减少到一个），来提升搜索性能。

**注意**：`optimize` API 不应该用在在一个动态索引（正在被活跃更新的索引），后台合并已经可以很好的完成工作。optimizing 会阻碍这个进程

optimizing 适合使用在日志等不会被经常更新的用例中：

```
POST /logstash-2014-10/_optimize?max_num_segments=1
```



### 索引

#### 创建索引

```
PUT /indexName
{
    "settings": {
        "index": {
            "number_of_shards": 3,
        	"number_of_replicas": 1
        }
    }
}
```

通过`PUT`方法，直接创建

在根目录下制定路径名即为索引名：`/{indexName}`

在`settings`字段中设置了索引的相关属性：

- `number_of_shards` 使用的**主分片数**，默认为5
- `number_of_replicas` **每个**主分片的**副本分片**数，默认为1

#### 修改副本数量

通过 update-index-setting API 修改

```
PUT /indexName/_settings/
{
    "number_of_raplicas"": 1
}
```

将副本的数量修改为`1`

#### 创建自定义字段

```
PUT /indexName
{
    "settings": {
        "number_of_shards": 3,
        "number_of_replicas": 2
    },
    "mapping": {
        "secilog": {
            "properties": { 
                "logType": {
                    "type":"string"	,
                    "index": "not_analyzed" # 不进行分析
                }
            }
        }
    }
}
```

在样例中，我们创建了一个名为`secilog`的类型，类型中有一个字段，字段的名称是`logType`，字段的数据类型是`string`，而且字段类型是**不进行分析**的。

#### 删除索引

```
DELETE /indexName
```

使用`DELETE`协议

删除索引需要指定索引名称，别名或者通配符。

删除索引可以使用逗号分隔符，或者使用`_all`或`*`号来删除全部索引。

为了防止误删除，可以设置`elasticsearch.yml`中属性`action.destructive_requires_name`为`true`，禁止使用通配符或者`_all`，必须使用名称或别名。

#### 获取索引

```
GET /indexName
```

显示系统中的全部信息，包括一些默认配置

#### 打开/关闭索引

```
POST /indexName
```

#### 映射管理



## JSON关键字

- `query` 查询主结构
  - `bool`
  - `must`
  - `match` 匹配器
  - `filter` 过滤器
    - `gt` 表示 *大于（great than）*
    - `lt` *小于（less than）*
- `highlight` 高亮
  - `field`
- `aggs` 聚合
  - `terms`
  - `avg`

