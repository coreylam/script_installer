# script_installer
一个存放常见的Shell安装脚本的项目，旨在为用户提供一键安装各种常见工具和软件的便捷方式。该项目汇集了多个常见工具和软件的安装脚本，用户可以通过从网络下载并执行这些脚本，轻松地完成工具和软件的安装过程。

## shell
### create_readme
- 说明
  
为了解决在 linux 服务器上创建多个服务，工作目录等内容后，容易忘记服务位置，以及工作目录混乱，同时也方便服务交接，因此将服务器上的一些关键的服务信息放到公共文件中，便于管理，并通过 readme 和 vireadme 进行查看和编辑

- 命令

```shell
curl -sLk https://raw.githubusercontent.com/coreylam/script_installer/main/shell/create_readme.sh | sh
```

# 不使用缓存，重新下载脚本

```shell
curl -sLk https://raw.githubusercontent.com/coreylam/script_installer/main/shell/create_readme.sh  -H "Cache-Control: no-cache" | sh 
```
### save_install

- 说明
在 python 中使用 pip install -r requirements.txt 安装时，容易出现当某一个包安装失败，则整个安装结束的情况，在一些无人值守任务上希望即使部分包安装失败，也继续安装其他依赖包。 一般有几种方式：
- 使用 `pip install -r requirements.txt --ignore-installed` ，能够在忽略已安装的，但对于安装失败，或者版本根本找不到，似乎不起作用
- 使用 `pip install $(grep -v '^#' requirements.txt | xargs)`, 逐行安装 requirements.txt，能够实现失败后继续往下安装，但对于 requirements.txt 存在一些复杂语法，例如 `MySQL-python ; sys_platform != 'win32'` 之类，则依旧失败

因此，单独写了个小脚本，用于实现跳过 requirements.txt 中的安装失败/错误 的包，但又最大限度保持兼容

```shell
curl -sLk https://raw.githubusercontent.com/coreylam/script_installer/main/shell/save_install.sh -o save_install.sh
chmod +x save_install.sh
```

使用方法：

```shell
# 脚本+正常的安装命令
./save_install.sh pip install -r requirements.txt

# 支持使用其他pip版本，如
./save_install.sh pip2 install -r requirements.txt
./save_install.sh pip3 install -r requirements.txt
./save_install.sh python -m pip install -r requirements.txt

# 支持其他依赖包文件名称，如
./save_install.sh pip install -r requirements_arm.txt
```
## docker 


## k8s


## helm
