# Linux封装服务

## 使用 `systemd`

### 创建.service文件

针对要创建的服务通常在`/lib/systemd/system/`目录下创建对应的`.service`名称的文件

### 设置`[Unit]`, `[Install]`段

#### `[Unit]`

`Description=`

​	对单元进行描述的字符串，用于UI中紧跟单元名称之后的简要描述性文字

`Requires=`

`Requisite=`

`Wants=`

`BindsTo=`



### 设置`[Service]`段

`Type=`

- 设置进程的启动类型

- 值

  - `simple`

    （设置了`ExecStart=`但未设置`BusName=`时的默认值）

    表示`ExecStart=`进程就是该服务的主进程。如果此进程需要为其他进程提供服务， 那么必须在该进程启动之前先建立好通信渠道(例如套接字)， 以加快后继单元的启动速度。

  - `forking`

    表示`Execute=`进程将会在启动过程中使用`fork()`系统调用。这是传统UNIX守护进程的经典做法。 也就是当所有的通信渠道都已建好、启动亦已成功之后， 父进程将会退出，而子进程将作为该服务的主进程继续运行。 对于此种进程， 建议同时设置 `PIDFile=` 选项， 以帮助 systemd 准确定位该服务的主进程， 进而加快后继单元的启动速度。

  - `oneshot` 

    (未设置 `ExecStart=` 时的默认值) 

    与 `simple` 类似， 不同之处在于该进程必须在 systemd 启动后继单元之前退出。 此种类型通常需要设置 `RemainAfterExit=` 选项。

  - `dbus` 

    (既设置了 `ExecStart=` 也设置了 `BusName=` 时的默认值) 

    与 `simple` 类似， 不同之处在于该进程需要在 D-Bus 上获得一个由 `BusName=` 指定的名称。 systemd 将会在启动后继单元之前， 首先确保该进程已经成功的获取了指定的 D-Bus 名称。 设为此类型相当于隐含的依赖于 `dbus.socket` 单元。

  - `notify`

    与 `simple` 类似， 不同之处在于该进程将会在启动完成之后通过 [sd_notify(3)](http://www.jinbuguo.com/systemd/sd_notify.html#) 之类的接口发送一个通知消息。 systemd 将会在启动后继单元之前， 首先确保该进程已经成功的发送了这个消息。 如果设为此类型， 那么下文的 `NotifyAccess=` 将只能设为非 `none` 值。 如果 `NotifyAccess=` 未设置， 或者已经被明确设为 `none` ， 那么将会被自动强制修改为 `main` 。 注意，目前 `Type=``notify` 尚不能在 `PrivateNetwork=``yes` 的情况下正常工作。

  - `idle`

    与 `simple` 类似， 不同之处在于该进程将会被延迟到所有活动的任务都完成之后再执行。 这样可以避免控制台上的状态信息与shell脚本的输出混杂在一起。 注意：(1) `idle` 仅可用于改善控制台输出，切勿将其用于不同单元之间的排序工具； (2)延迟最多不超过5秒，超时后将无条件的启动服务进程。

`ExecStart=`

​	在启动该命令时需要执行的命令行

​	在非`Type=oneshot`下，必须且只能设置一个命令行，多个命令行可以在同一个`ExecStart=`中设置，也可以通过设置多个`ExecStart=`达到相同的效果

`ExecStartPre=`, `ExecStartPost=`

​	设置在执行`ExecStart=`之前或之后执行的命令

`ExecStop=`

`ExecReload=`

`User=` 

​	设置启动用户