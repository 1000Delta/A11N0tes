# Linux 添加第三方软件

1. 下载软件并解压

   ```bash
   tar -zxvf xxx-xxx-xxx-x-xxxxxx.tar.gz
   ```

2. 将软件移动到`/opt`

3. 创建软件图标的代码

   ```bash
   sudo vim /usr/share/applications/program.desktop #program为软件名
   
   [Desktop Entry]
   Name=				#图标显示的名称
   Comment=			#备注
   Encoding=			#编码方式
   Exec=				#从shell启动的全命令，即第三方软件的执行文件
   Icon=				#图标
   StartupNotify=true
   Terminal=false
   Type=Application	#类型，填Application
   Categories=			#图标分类
   ```

   

   

