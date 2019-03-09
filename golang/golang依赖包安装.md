# Go依赖包安装

使用VSCode安装Go的依赖包会出现部分安装失败的问题，其中部分可使用以下安装：

```powershell
go get -u github.com/haya14busa/gopkgs/cmd/gopkgs
go get -u github.com/sqs/goreturns
```

## 流程

首先需要在GOROOT下创建文件夹并下载依赖:

```shell
mkdir --parents $GOPATH/src/golang.org/x
git clone https://github.com/golang/tools.git tools
```

然后在vscode终端中下载