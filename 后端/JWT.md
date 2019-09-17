# JWT

JWT(Json Web Token)是一个开放标准，它定义了一种用于简洁、自包含的用于通信双方之间以JSON对象的形式安全传递信息的方法。

- 简洁（Compact）

  可以通过URL，POST参数护着在HTTP header中发送，因为数据量小，传输速度快

- 自包含（Selt-contained）

  负载中包含了所有用户所需要的信息，避免了多次查询数据库

  