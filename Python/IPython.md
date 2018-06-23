# IPython模块

## 基本功能

- Tab自动补全
- 历史记录读档
- 行内编辑
- 使用`%run`调用外部Python脚本
- 支持系统命令
- 支持pylab模式
- Python代码调试与性能分析

## 操作

`quit()` 退出IPython shell

`%logstart` 开始记录会话

`%run` 调用外部脚本

- `-d` 开启ipdb调试器
  - `c` 逐行执行
  - `quit` 关闭调试器
- `-p` 对脚本进行性能分析
- 