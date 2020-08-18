# k8s 入门

> 学习教程：
>
> 1. [使用kubeadm安装kubernetes_v1.18.x](https://kuboard.cn/install/install-k8s.html#%E4%BD%BF%E7%94%A8kubeadm%E5%AE%89%E8%A3%85kubernetes-v1-18-x)
> 2. [安装Kubernetes高可用](https://kuboard.cn/install/install-kubernetes.html#%E5%AE%89%E8%A3%85kubernetes%E9%AB%98%E5%8F%AF%E7%94%A8)

> 本文会按照我使用工具的一般流程来进行分节的撰写

## 下载 & 安装

基本工具：

- `kubeadm`     部署 Kubernates 节点和集群
- `kubelet`     与容器运行时的接口
- `kubectl`     命令行工具

## 基本命令

## 创建主节点

```bash
$ kubeadm init
```

