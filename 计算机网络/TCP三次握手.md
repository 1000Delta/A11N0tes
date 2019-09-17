# TCP 三次握手

## 相关概念

**SYN（Synchronize Sequence Numbers）**  
同步序列编号

**ACK（Acknowledgement）**  
确认字符

**SYN_SENT 状态**  
表示请求连接，是TCP三次握手中第一次发送SYN包后的等待状态

**SYN_RECV 状态**  
是服务端被动打开后，接受到了客户端的SYN并且发送了ACK之后的状态

**ESTABLISHED 状态**  
表示TCP连接成功，在客户端接受到服务端的SYN+ACK，向服务端发送ACK成功之后，客户端和服务端都会进入此状态，开始发送数据。

## 握手流程

1. 客户端向服务端发送SYN包（SYN=x），并进入SYN_SEND状态；
2. 服务端接收到SYN包，确认客户端的SYN包（ACK=x+1），然后向服务器返回一个SYN包（SYN=y），即SYN+ACK包，此时服务器进入SYN_RECV状态；
3. 客户端接收到服务器返回的（SYN+ACK）包，向服务器发送确认包ACK（ACK=y+1），此包发送完毕，服务端与客户端进入ESTABLISHED状态，三次握手完成。

三次握手完成后，客户端与服务端开始发送数据。