#!/bin/bash
#输入参数为子项目名称
#根据子项目名称去child-project-list.txt中找到对应的记录
basepath=$(cd `dirname $0`; pwd)  #当前执行脚本的存放路径
dirname=`cat $basepath/../config/project-name.txt`
childProjectName=$1
#生成子项目目录结构
cd $basepath
cd ../../$dirname/src/sub-projects
findChildProjectName=$(cat $basepath/../config/child-project-list.txt | grep $childProjectName | awk -F ',' '{print $1}')
findChildProjectGit=$(cat $basepath/../config/child-project-list.txt | grep $childProjectName | awk -F ',' '{print $2}')
if [ -z $findChildProjectName ];then
    echo "empty string"
else 
    echo "haha,$findChildProjectName"
fi

if [ ! -d $findChildProjectName ];then
    mkdir $findChildProjectName
    cd ./$findChildProjectName
    git init 
    git remote add origin $findChildProjectGit
    git fetch
    git checkout master
    git pull origin master
else
    echo "$findChildProjectName exist,inited before."
fi