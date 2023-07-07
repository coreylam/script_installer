#!/bin/bash
# 检查输入参数是否为空
if [ $# -eq 0 ]; then
  echo ""
  echo "# 脚本+正常的安装命令"
  echo "./save_install.sh pip install -r requirements.txt"
  echo ""
  echo "# 支持使用其他pip版本，如"
  echo "./save_install.sh pip2 install -r requirements.txt"
  echo "./save_install.sh pip3 install -r requirements.txt"
  echo "./save_install.sh python -m pip install -r requirements.txt"
  echo ""
  echo "# 支持其他依赖包文件名称，如"
  echo "./save_install.sh pip install -r requirements_arm.txt"
  echo ""
  exit 1
fi

# 使用sed命令替换参数
command=$@
echo $command

# 遍历输入参数, 获取 -r 后的参数（处理非 requirements.txt 的情况）
while [[ "$#" -gt 0 ]]; do
  case $1 in
    -r)
      x="$2"
      shift
      ;;
    *)
      ;;
  esac
  shift
done

# 使用sed命令替换参数
command=$(echo "$command" | sed 's/\(-r\) [^ ]*/\1 \/tmp\/temp.txt/g')

echo "==================" > /tmp/install_success_log
echo "==================" > /tmp/install_fail_log
# 针对每个临时文件进行pip安装
while IFS= read -r line; do
  echo $command
  # 创建临时文件
  echo $line > /tmp/temp.txt
  cat /tmp/temp.txt
  # 安装临时文件中指定的包
  $command

  # 记录安装结果
  if [ $? -eq 0 ]; then
    echo "Package $line installed successfully" >> /tmp/install_success_log
  else
    echo "Failed to install package $line" >> /tmp/install_fail_log
  fi

  # 删除临时文件
  rm /tmp/temp.txt
done < "$x"



cat /tmp/install_success_log
cat /tmp/install_fail_log
rm /tmp/install_success_log /tmp/install_fail_log
