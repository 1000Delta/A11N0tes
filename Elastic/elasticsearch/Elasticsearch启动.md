# Elasticsearch启动

```bash
bin/elasticsearch
```

## 选项

- `-d` 启动在后台



## 多节点启动

在一台服务器上进行多节点启动，首先需要将elasticsearch的文件全部复制一份并重命名，然后**删除`data/`中的文件**：

```bash
cp -R elasticsearch/ elasticsearch-node-2/
rm -rf elasticsearch-node-2/data/* # 新节点不能有原节点的数据 
```

修改节点的配置文件`elasticseach/config/elasticsearch.yml`

其中，不同节点之间要保持集群名称的一致：

```yaml
#...
cluster.name: local
#...
```

然后不同节点的节点名需要不同：

```yaml
#...
node.name: node-1
#...
```

然后分别启动节点，在`\_cluster\health`中就可以看到节点数增加了