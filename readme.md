## 项目定位
辅助构建mfe项目

## 项目目标
可以一键自动构建gmoa整套最新代码到本地,全程无需手动参与

## 常用命令

|       命令       | 作用 | 重命名 | 短名释疑 |
| ------ | ------ | ------ | ------ |
| checkout.sh | 统一切换所有项目分支 | alias co="checkout.sh" | co: checkout |
| init-project.sh | 自动创建并拉取代码 | alias ipt="init-project.sh test" | ipt: init project test |
| gitpull.sh | 拉取代码到本地分支 | alias gpt="gitpull.sh" | gpt: git pull test |
| set-child-project.sh | 设置子项目 | alias scp="set-child-project.sh" | scp: set child projecta |
| get-child-project.sh | 得到子项目(根据child-project-list.txt指定记录) | alias gcp="get-child-project.sh" | gcp: get child project |

## 新增加一个子项目的流程:
用户A  
    1.在gitlab上新建子项目prefix-xxx(private的),设置number权限  
    2.运行scp prefix-xxx命令创建子项目prefix-xxx,记得手动维护一下child-project-list.txt,并提交mfe-cli到master分支,(如果已经启动项目,则显示停掉重新启动)  
用户B  
进入mfe-cli/bin目录里面,执行gcp(./get-child-project.sh 300)即可将最新的项目同步下来(会自动创建目录,并拉取代码)  

## 名词解释
### 解释配置文件
* jsy/build/webpack.base.js
* jsy/src/router/index.js
* jsy/src/store/index.js  
*这里涉及到多个配置文件的修改,如果是手动修改,很容易遗漏或改错,自动化可以省去这方面的重复繁琐的工作,同时保证每次配置文件修改的正确性.*
