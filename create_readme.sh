#!/bin/bash

# 获取命令行输入的路径
path=$1
if [ -z "$path" ]; then
    path=~
fi

# 在指定路径下创建.readme.md文件
touch "$path/.readme.md"

# 添加alias
echo "alias readme='cat $path/.readme.md'" >> ~/.bashrc
echo "alias vireadme='vim $path/.readme.md'" >> ~/.bashrc

# 使alias立即生效
source ~/.bashrc

echo "创建.readme.md文件并添加alias完成！ 通过 readme 命令查看本机的服务说明， vireadme 查看"
