# NodeMCU连接wifi

```lua
--init.lua
print("set up wifi mode")
wifi.setmode(wifi.STATION)
wifi.sta.config("SSID","PASSWORD")
wifi.sta.connect()
tmr.alarm(1,1000,1,function()
    if wifi.sta.getip() == nil then
        print("IP unavaliable, Waiting...")
    else
        tmr.stop(1)
        print("Config done, IP is "..wifi.sta.getip())
        --dofile("yourfile.lua")
    end
end)
```

在其中有一句：

```lua
wifi.sta.config("SSID","PASSWORD")
```

会报错，因为在新版固件中，API被修改了，config接收的参数修改为一个table类型，格式为：

```lua
config = {
    ssid="SSID",
    pwd="PASSWORD"
}
```

然后便可以进行使用：

```lua
wifi.sta.config(config)
--wifi.sta.condig{ssid="SSID",pwd="PASSWORD"}
```

