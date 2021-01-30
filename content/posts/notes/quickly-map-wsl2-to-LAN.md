---
title: '快速映射 WSL2 到局域网'
date: 2021-01-30
lastmod: 2021-01-30
description: ''
tags: [WSL2, Linux, Windows]
categories: [WSL2]
# image: "/image/blog-pic.jpg"
---

> 由于需要在局域网内使用 `scp` 等工具，又懒得换到 Linux 环境，因此想办法将 WSL2 的 ssh 开放到局域网。

主要用到的就是 Windows 的端口转发功能，通过 `netsh` 命令进行操作。

## 查看当前 IPv4 端口转发表

```powershell
netsh interface portproxy show v4tov4
```

## 添加端口转发配置

```powershell
netsh interface portproxy add v4tov4 listenaddress=127.0.0.1 listenport=10022 connectaddress=172.29.181.252 connectport=22
```

此处 listen 表示的是 Windows 监听的 IP 和端口，使用 127.0.0.1 表示监听发向本机的请求

connect 表示转发的目标 IP 和端口，此处是我 WSL2 实例的虚拟机 IP 地址（Windows 可以访问）

查看配置：

```powershell
netsh interface portproxy show v4tov4

侦听 ipv4:                 连接到 ipv4:

地址            端口        地址            端口
--------------- ----------  --------------- ----------
127.0.0.1       10022       172.29.181.252  22
```
