# Docker 部署 ES 集群

## 本地测试环境

部署主节点：

```powershell
docker run -it -d -p 9200:9200 -p 9300:9300 -v D:\tmp\ES\node1\elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml -v D:\tmp\ES\node1\data:/usr/share/elasticsearch/data --name esNode1 elasticsearch:6.4.2
```

主节点配置文件：

```yaml
cluster.name: es-test
node.name: node1
node.master: true
node.data: true
network.host: 0.0.0.0
```

部署数据节点：

```powershell
docker run -it -d -v D:\tmp\ES\node2\elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml -v D:\tmp\ES\node2\data:/usr/share/elasticsearch/data -p 9301:9300 --name esNode2 elasticsearch:6.4.2
```

数据节点配置文件：

```yaml
cluster.name: es-test
node.name: node2
node.master: false
node.data: true
network.host: 0.0.0.0
```

启动Kibana

```powershell
docker run -it -d -p 5601:5601 --name kibana kibana:6.6.0
```

