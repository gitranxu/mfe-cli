#!/bin/bash  
#先切换分支,再拉取代码到本地

basepath=$(cd `dirname $0`; pwd)  #当前执行脚本的存放路径

env=$1

#根据用户指定的环境,切换到相应的分支
$basepath/checkout.sh $env

#根据用户指定的环境,拉取远程代码到本地
$basepath/git-pull.sh $env