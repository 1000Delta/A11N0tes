# Redis持久化

## RDB

## AOF

AOF即append-only file，启用AOF持久化存储方式时，Redis会将每一个收到的写命令都通过write函数追加到文件中（默认`appendonly.aof`）。当Redis重启时会通过重新执行文件中保存的写命令来重建数据库，通过配置文件可以指定Redis写入硬盘的时机（使用`fsync`强制 os 写入）。

```properties
appendonly yes // 启用 AOF 持久化方式
#appendfsync always // 收到命令就立即写入磁盘，保证实时性。
appendfsync everysec // 每秒钟写入磁盘一次，在性能和实时性方面折中。
#appendfsync no // 完全依赖 os，性能最好，实时性没有保证。
```

