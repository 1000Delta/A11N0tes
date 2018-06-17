# zipfile



## ZipFile 类

声明：

`class zipfile.ZipFile(file[, mode[, compression[, allowZip64]]])`

ZipFile对象表示一个zip文件。

参数：

- file                     表示文件的路径或者类文件对象（file-like object）
- mode                指示打开zip的方式，默认值为'r'，有r, w, a三种，分别为读、写、追加
- compression    表示写入是使用的压缩方法，它的值可以是`zipfile.ZIP_STORED`或`zipfile.ZIP_DEFLATED `
- allowZip64        如果要操作的文件大小超过2G，应该将其设置为`True`



### 常用方法和属性

- `ZipFile.getinfo(name)`

  获取zip文档内**指定文件**的信息。返回一个`zipfile.ZipInfo`对象，它包括文件的详细信息。 

- `ZipFile.infolist()`

  获取zip文档内所有文件的信息，返回一个`zipfile.ZipInfo`的列表。 

- `ZipFile.namelist()`

  获取zip文档内所有文件的名称列表。 

- `ZipFile.extract(member[, path[, pwd]])`

  将zip文档内的**指定文件**解压到当前目录。

  - `member`指定要解压的文件名称或对应的`ZipInfo`对象；
  - `path`指定了解析文件保存的文件夹；
  - `pwd`为解压密码。 

- `ZipFile.extractall([path[, members[, pwd]]])`

  解压zip文档中的所有文件到当前目录。

  members`的默认值为zip文档内的所有文件名称列表，也可以自己设置，选择要解压的文件名称。

- `ZipFile.printdir()`

  将zip文档内的信息打印到控制台上。

- `ZipFile.setpassword(pwd)`

  设置zip文档的密码。

- `ZipFile.read(name[, pwd])`

  获取zip文档内指定文件的二进制数据。