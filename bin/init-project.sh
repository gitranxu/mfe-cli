#!/bin/bash  
#首先执行chmod 777 ./init-project.sh使其可以执行
#如果是window的话,需要配置一下环境变量,将当前目录增加进去,然后使用git Bash窗口打开,
#执行init-project.sh xxx即可.也可以执行alias gp3="init-project.sh 300",这样每次执行gp3就行

#如果是mac的话,在~目录中,如果有.zshrc文件,则在最后面加上 source ~/.bash_profile语句
#在~/.bash_profile中将当前目录加入:export PATH=/Users/ranx/gome/work/xxx/init-gmoa/bin:$PATH
#在~/.bashrc中写入alias gp3="init-project.sh 300",这样就可以在任何地方打开终端窗口,执行gp3就可以拉取代码了,^_~

basepath=$(cd `dirname $0`; pwd)  #当前执行脚本的存放路径

env=$1

if [ -z $env ];then
    echo "请输入环境变量参数:300 500 or 800"
    exit 1
else
    echo "当前环境为:$env"
fi

#根据配置文件,动态生成各子项目目录并关联上git仓库
$basepath/mkdir-fetch.sh

#根据用户指定的环境,切换到相应的分支
$basepath/checkout.sh $env

#根据用户指定的环境,拉取远程代码到本地
$basepath/git-pull.sh $env

# #执行更新命令
# $basepath/update.sh