#!/bin/bash
#创建完后,一定要记得手动维护一下child-project-list.txt文件
basepath=$(cd `dirname $0`; pwd)  #当前执行脚本的存放路径
dirname=`cat $basepath/../config/project-name.txt`
childProjectName=$1
#生成子项目目录结构
cd $basepath
cd ../../$dirname
npm run create $childProjectName