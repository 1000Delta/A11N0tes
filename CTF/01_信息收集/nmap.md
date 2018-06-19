# Nmap 使用方法

## 扫描参数

- `nmap IP` 对指定IP进行扫描
- `-p <ports> <IP>` 指定端口
- `-sT <IP>` 对目标主机进行全连接扫描
- `-sS <IP>`  对目标主机进行半连接扫描
- `-oX <filename> <IP>` 将扫描结果以xml形式输出
- `-vv <IP>` 详细描述输出扫描

## 操作

### 全面扫描

---

命令形式：

`nmap -T4 -A -v <targethost>`

- `-A` 进攻性（Aggressive）方式扫描
- `-T4` 指定扫描过程的时序（Timing），总共有6个级别（0-5），级别越高，扫描速度越快，但也越容易被防火墙或IDS检测并屏蔽掉，在网络通讯状况良好的情况推荐使用T4;
- `-v` 表示显示冗余（verbositry）信息，在扫描过程中显示扫描的细节，从而让用户了解当前的扫描状态 



### 版本检测

---

- `-sV` 指定让Nmap进行版本侦测
  - `--version-intensity <level>` 指定版本侦测强度（0-9），默认为7。数值越高，探测出的服务越准确，但是运行时间会比较长。
  - `--version-light` 指定使用轻量侦测方式（intensity 2）
  - `--version-all` 尝试使用所有的probes进行侦测（intensity 9）
  - `--version-trace` 显示出详细的版本侦测信息。



### OS侦测

---

- `-O` 指定Nmap进行OS侦测
- `--osscan-limit` 限制Nmap只对**确定的主机**进行OS探测（至少需知该主机分别有一个open和closed的端口）。
- `--osscan-guess` 大胆猜测对方的主机的系统类型。由此准确性会下降不少，但是会尽可能多提供潜在的操作系统。



### 端口扫描

---

#### 全部端口

`nmap <host>`



#### 指定端口

nmap 默认扫描目标1-10000范围内的端口号。我们可以通过参数-p来设置我们将要扫描的端口号

`nmap -p1-500 192.168.1.1`

- `-p<range>` range为要扫描的端口范围，端口大小不能超过65535，多个端口用逗号分隔



### 网段扫描

`nmap -sP <network address> </CIDR>`

- `-sP` 
- CIDR为你设置的子网掩码

例：`namp -sP 192.168.200.0 /24`



### 路由跟踪

---

`nmap --traceroute <target IP>`

