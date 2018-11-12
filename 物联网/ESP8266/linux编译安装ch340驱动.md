# linux编译安装ch340驱动

1. 在网站上[下载](http://www.wch.cn/download/CH341SER_LINUX_ZIP.html)相关驱动

2. 由于linux内核自带ch340驱动，因此需要删除系统自带旧版驱动：

   ```bash
   sudo rm /lib/modules/$(uname -r)/kernel/drivers/usb/serial/ch341.ko
   ```

3. 编译安装驱动：

   ```bash
   unzip CH341SER_LINUX.ZIP
   cd CH341SER_LINUX
   make
   make load
   ```

   编译报错：

   ```bash
   error: unknown type name ‘wait_queue_t’; did you mean ‘wait_event’?
     wait_queue_t wait;
     ^~~~~~~~~~~~
     wait_event
   error: implicit declaration of function ‘signal_pending’; did you mean ‘timer_pending’? [-Werror=implicit-function-declaration]
      if( signal_pending(current) )
          ^~~~~~~~~~~~~~
          timer_pending
   ```

   - `wait_queue_t`的问题，可以直接将这一句定义注释掉，因为`wait`变量没有使用。。。

   - `signal_pending`的问题，由于linux好版本内核已经将`signal_pending()`移动到了`/include/linux/sched/signal.h`中，所以需要引入此文件：

   ```c
   #include <linux/sched/signal.h>
   ```

4. 把驱动设为自启动，把驱动放入原路径：

   ```bash
   sudo cp ch34x.ko /lib/modules/$(uname -r)/kernel/drivers/usb/serial/
   ```

