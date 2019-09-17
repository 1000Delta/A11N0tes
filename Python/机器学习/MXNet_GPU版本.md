# MXNet_GPU版本

## 安装

安装时指定cuda版本即可

```shell
pip install mxnet-cu<cuda_version>
```

比如`cuda8.0`:

```shell
pip install mxnet-cu8
```

## 问题

### 使用时提示`libcudart.so.<cuda_version>`找不到

添加系统库文件配置:

```shell
vim /etc/ld.so.conf.d/cuda.conf
```

在其中添加:

```con
/usr/local/cuda/lib64
```

然后加载配置文件

```shell
sudo ldconfig -v
```

