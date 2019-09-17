# Linux电源管理

## 关机

```sh
sudo halt
sudo init 0
# 立即关机
sudo shutdown -h now
sudo shutdown -h 0
# 延时关机
sudo shutdown -h 10:10
sudo shutdown -h +30 # 单位min
```

## 重启

```sh
sudo reboot
sudo init 6 
sudo shutdown -r now
```

## 休眠

```sh
sudo pm-hibernate
echo "disk" > /sys/power/state
sudo hibernate-disk
```

## 挂起

```sh
sudo pm-suspend
sudo pm-suspend-hybrid
echo "mem" > /sys/power/state
sudo hibernate-ram
```

