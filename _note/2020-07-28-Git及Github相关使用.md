---
layout: post
title: 'Git及Github相关使用'
date: 2020-07-28
permalink: /posts/github
tags:
  - Git
  - 编程
---



> git命令使用手册

<!-- more -->

# Github

```shell
#从github拉取项目到本地
git clone https://

#提交修改
git add .
git commit -m "修改信息"
git push origin master # master可以改为其它任何分支

#更新远端代码到本地
git pull

#放弃本地修改，强制更新远端代码到本地
git reset --hard origin/master
git pull

#修改当前文件夹关联的库
git remote rm origin  #先删除原来的
git remote add origin http://   #再加上新的

#切换分支
git chechout feature_wj
git branch -a  #查看所有的分支

#上传本地文件夹
git init  #初始化
git add .
git commit -m ""
git remote add origin ... #和远程仓库匹配
git push -u origin master

#上传本地分支到远程新的分支
git branch test
git checkout test
git remote add origin ... #和远程仓库匹配
git push origin test

#拉取指定分支到本地
git clone -b <指定分支名> <远程仓库地址>
```





# Git Page

```shell
# 安装jekyll
## --这之前首先要安装ruby和gem，但mac上不用自己安装
gem install jekyll

#开始使用
jekyll build #首次使用
jekyll server #开启本地预览
bundle exec jekyll server  #如果上面不行，就用这个
```

