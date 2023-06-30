#!/bin/bash

# 获取命令行输入的路径
# read -p "Please enter a path (default is ~): " path

# If the user didn't enter a path, use ~ as the default path
if [ -z "$path" ]; then
    path=`realpath ~`
fi

# 在指定路径下创建.readme.md文件
touch $path/.readme
echo "readme file $path/.readme"

# 添加alias
echo "添加 reame, vireadme 命令到 ~/.bashrc"
if ! grep '^alias readme' ~/.bashrc; then
    echo "alias readme='cat $path/.readme'" >> ~/.bashrc
fi

if ! grep "^alias vireadme" ~/.bashrc; then
    echo "alias vireadme='vim $path/.readme'" >> ~/.bashrc
fi

# 使alias立即生效
source ~/.bashrc

echo "创建.readme.md文件并添加alias完成！"
echo "命令: "
echo " - readme : 命令查看本机的服务说明"
echo " - vireadme : 编辑本机的服务说明"
