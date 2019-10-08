#!/bin/bash  
#这条命令完成的功能是:
#1.读取一个配置文件,然后动态生成各子项目目录
#2.每个子项目目录在初次创建的时候,自动关联上git仓库
#3.child-project-list.txt这个文件中,如果有记录,每一行格式应该是[子项目名称,所在git仓库地址]   例如:jsy-meeting,git@10.128.46.40:ranxu2/gmoa-meeting.git
basepath=$(cd `dirname $0`; pwd)  #当前执行脚本的存放路径
childProjectListTxt="$basepath/../config/child-project-list.txt"

cd $basepath
cd ../../ #切换到上级目录,我们要在mfe-cli项目的外面创建目录,这样能保证创建的目录与当前的项目不是同一个git库
dirname=`cat $basepath/../config/project-name.txt`
echo "enter dir $dirname"
if [ ! -d $dirname ];then
    mkdir $dirname
else
    echo "$dirname exist"
fi
cd ./$dirname
echo "enter dir $dirname"
portalGit=`cat $basepath/../config/portal-project-git.txt`
git init
git remote add origin $portalGit
git fetch
git checkout master
git pull origin master

pwd

cd ./src/sub-projects/

for childProject in `cat $childProjectListTxt`
do
    #判断一下子目录是否存在,如果存在则说明之前初始化过了,不用管
    childName=$(echo $childProject | awk -F ',' '{print $1}')
    childGit=$(echo $childProject | awk -F ',' '{print $2}')
    #echo "childGit: $childGit"
    if [ ! -d $childName ];then
        if [ -n $childName ];then
            mkdir $childName
            cd ./$childName
            git init
            git remote add origin $childGit
            git fetch
            cd .. #记得操作完后,还要回到操作前的工作目录
        else
            echo "$childName is just a empty String."
        fi
    else
        echo "$childName exist,inited before."
    fi
done