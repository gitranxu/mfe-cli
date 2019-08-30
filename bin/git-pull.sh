#!/bin/bash  
#这条命令完成的功能是:
#1.将portal及各子项目的分支代码摘取到本地
basepath=$(cd `dirname $0`; pwd)  #当前执行脚本的存放路径
childProjectListTxt="$basepath/../config/child-project-list.txt"
cd $basepath
cd ../../ #切换到上级目录,我们要在mfe-cli项目的外面创建目录,这样能保证创建的目录与当前的项目不是同一个git库
dirname=`cat $basepath/../config/project-name.txt`
cd ./$dirname

branchName=$1
echo "分支名称: $branchName"

git pull origin $branchName

pwd

cd ./src/sub-projects/
for childProject in `cat $childProjectListTxt`
do
    #判断一下子目录是否存在,如果存在则说明之前初始化过了,不用管
    childName=$(echo $childProject | awk -F ',' '{print $1}')
    cd ./$childName
    git pull origin $branchName
    cd .. #记得操作完后,还要回到操作前的工作目录
done