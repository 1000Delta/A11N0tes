## shell数组语法报错：Syntax error: "(" unexpected

### 原因：

由于使用`dash`启动脚本的问题。

### 解决方法：

在脚本开头修改：

```shell
#!/bin/sh
```

为：

```shell
#!/bin/bash
```

或其他shell

或者直接修改`/bin/sh`的重定向到`bash`或其他shell