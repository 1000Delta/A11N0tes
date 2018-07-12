# Dockerfile的编写

与git类似，对于项目中要排除的文件，在项目的根目录下新建一个文本文件`.dockerignore`，写入你要排除的文件/目录。

## 创建Dockerfile

### 相关命令

- `FROM image:tag` 表示该image继承自某个image的某个tag