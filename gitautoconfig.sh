#!/bin/sh
# 路径显示中文，而不是编码
git config --global core.quotepath false

# 当前项目保存密码
git config credential.helper store