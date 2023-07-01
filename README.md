# script_installer
一个存放常见的Shell安装脚本的项目，旨在为用户提供一键安装各种常见工具和软件的便捷方式。该项目汇集了多个常见工具和软件的安装脚本，用户可以通过从网络下载并执行这些脚本，轻松地完成工具和软件的安装过程。

## shell
### create_readme
- 说明
  
为了解决在 linux 服务器上创建多个服务，工作目录等内容后，容易忘记服务位置，以及工作目录混乱，同时也方便服务交接，因此将服务器上的一些关键的服务信息放到公共文件中，便于管理，并通过 readme 和 vireadme 进行查看和编辑

- 命令

```shell
curl --fsSL https://raw.githubusercontent.com/coreylam/script_installer/main/create_readme.sh | sh
```

# 不使用缓存，重新下载脚本
```shell
curl -fsSL https://raw.githubusercontent.com/coreylam/script_installer/main/create_readme.sh  -H "Cache-Control: no-cache" | sh 
```

## docker 


## k8s


## helm