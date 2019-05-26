# Compose模板文件

## 从示例出发

```yaml
version: "3"
services:
	webapp:
		image: examples/web
		deploy:
			replicas: 2
			resources:
				limits:
                    cpus: "0.1"
                    memory: 100M
                restart_policy:
                	condition: on-failure
        ports:
        	- "80:80"
        networks:
        	- mynet
        volumes:
        	- "/data"
networks:
	mynet:
```

- version 版本号
- services 指定服务的根，在其中创建服务
  - webapp 服务名，内部写服务配置
    - image 服务使用的镜像
    - deploy 服务环境配置
    - ports 服务映射的端口
    - networks 服务使用的网络
    - ... 其他Docker容器相关的配置
- networks 创建的网络