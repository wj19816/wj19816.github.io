---
layout: post
title: 'Linux及shell相关使用'
date: 2020-07-28
permalink: /posts/linux
tags:
  - code
  - 环境搭建

---



# Linux

```shell
# 一些简单的常用操作
## tips:按tab键可以快速填充

ls #查看文件夹

cd xxxx   ##前往文件夹
cd ..     #前往上层文件夹

pwd   #查看当前文件夹的绝对路径

mkdir #新建文件夹
rm -r -f #删除文件夹：-r 删除文件夹里的所有目录 -f 直接强行删除
rm -f dir-*.jpg  #可以用通配符*同时删除多个文件
rm -i dir  #在删除前进行询问

cp #复制文件
cp -a source destination #复制文件属性+递归持续复制（复制整个目录）
#如果destination为文件名，则重命名

mv -f -u #移动文件与目录，或修改名称：-f 强制删除 -i 询问是否覆盖 -u 若已存在，而source比较新，才会升级

./test.sh #运行某个shell脚本，必须要加上“./”，如果不加，系统会去/bin之类的系统目录里查找该文件

touch xxx   #创建文件
cat -n xxx  #从第一行开始显示文件内容,同时输出行号（若要空白行不显示行号，用-b）
tac xxx     #从最后一行开始显示文件内容
nl xxx      #显示时顺便输出行号
more xxx    #分页显示文件内容，空格：翻一页 回车：翻一行 /子串：在当前搜索该关键字
less xxx    #分页显示文件内容，但可以向前翻页 ?字串：向上搜索关键词 n：重复前一个搜索
head -n 20 xxx    #只看前几行,默认显示10行
tail xxx    #只看最后几行



# 关机操作
sync #将数据内存同步到硬盘
shutdown -h now #立马关机
shutdown -r +10 #十分钟后重启
```

![img](https://www.runoob.com/wp-content/uploads/2015/10/vi-vim-cheat-sheet-sch.gif)

## Vim

```shell
#刚进入vim时默认进入命令模式
i  #切换到输入模式
x  #删除当前光标所在字符
:  #切换到底线命令模式，在最底一行输入命令

#底线命令模式
:w  #保存
:q!  #不保存，强行离开
:wq  #保存后离开
:w [filename]  #储存成另一个文档
:r [filename]  #在当前文档中读入另一个文档的数据，插入到当前光标后
:n1,n2 [filename]  #将n1行到n2行的内容储存成新文档
:![commond]  #暂时离开vim到命令行中执行command

#快捷键操作
H/M/L  #光标移动到这个屏幕的最上方/中央/下方那一行的第一个字符
ndd  #删除光标所在的向下n行
d1G  #删除光标到第一行的所有数据
dG   #删除光标到最后一行的所有数据
yy   #复制光标所在哪一行

#搜索替换
/word  #向下寻找
?word  #向上寻找
n   #继续向下寻找
N   #返回向上寻找
:n1,n2s/word1/word2/g  #在n1与n2行之间寻找word1，并将该字符串取代为word2（1：第一行，$最后一行

#环境设置
:set nu #显示行号
:set nonu #取消行号
```

```shell
#批量添加注释
1. ctrl+v 进入块选择模式
2. 移动光标选择所要的行
3. 大写I进入插入模式
4. 输入注释符号//或#
5. 按两下esc
```



## 快捷键

```shell
command+D  #在同一窗口内打开另一个shell窗口标签
command+←→ #快速移动到行首或行尾
```



# Shell

> shell编程环境也有许多，如Bourne Shell、Bourne Again Shell、C Shell、K Shell等，一般常用的是Bourne Again Shell(即bash)，这也是linux系统默认的shell。

## 常用

```shell
#!/bin/bash          #指定shell解释器

#echo
echo '输出一些文字' 
echo -e "OK!\n"   #-e 开启转义
echo "hello world!" > myfile  #结果重定向至文件
echo `date`  #显示时间

#变量
var1='定义一个变量，等号周围没有空格'
readonly var1  #只读变量
unset var1     #删除变量

#字符串
echo '${var1}，使用一个变量'   #!!单引号中的所有字符都会被原样输出，引用变量无效
echo `expr index "$string" io`  #查找字符i或o的位置(看哪个先出现)
echo ${#string}  #获取字符串长度
-z #检测字符串长度是否为0
-n #检测字符串长度是否不为0
$  #检测字符串是否为空

#定义数组
array_n=(v0 v1 v2)
array_n[n]=vn  #可以不使用连续的下标，而且下标的范围没有限制
${array_n[@]}  #读取数组中的所有元素

#Shell 里面的中括号（包括单中括号与双中括号）可用于一些条件的测试
[ $var -eq 0 ] #变量是否为0
[ -e $var ]    #文件是否存在
[ -d $var ]    #是否是目录
[[ $var1 = $var2 ]] #字符串比较

-s file  #检测文件是否存在，不为空返回true
-e file  #检测文件（或目录）是否存在，如果是，返回true

#printf（不会自动换行），但更适合格式输出
read var  #从键盘读入输入

readlink -f #一直跟随符号链接，直到直到非符号链接的文件位置
```

## 控制逻辑

```shell
#if条件
if condition
then
		command1
elif condition2
then
		command2
else
		command3
fi


#for循环
for var in i1 i2 i3
do 
		command1
		command2
done


#while循环
while condition
do
		command
done
	
	
#until循环:和while循环相反，直到条件为true时停止(用得少)
until condition
do 
		command
done


#case
case array in 
	1) command
	;;
	2) command
	;;
	*) command
	;;
esac

```



## 运算符

> 原生bash不支持数学运算，但可以用awk和expr来进行求值操作。

```shell
#数学运算
val=`expr 2 + 2` #!!!表达式和运算法之间一定要有空格

#关系运算
-eq   #equal
-ne   #not equal
-gt   #great than
-lt   #lower than
-ge   #great equal
-le   #lower equal

#布尔运算
!    #非
-o   #或，有一个为true即为true （or）
-a   #与，两个都为true才为true （and）

#逻辑运算
&&  #逻辑的and [[ $a -lt 100 && $b -gt 100 ]] 返回 false
||  #逻辑的or  [[ $a -lt 100 || $b -gt 100 ]] 返回 true
```





## 脚本参数

```shell
$#  #传递到脚本的参数个数
$*  #显示所有向脚本传递的参数
$$  #脚本当前运行的进程ID号
$!  #后台运行的最后一个进程的ID号
$@  #用引号分割，显示所有脚本参数
$-  #显示shell使用的当前选项
$?  #显示最后命令的退出状态。0表示没有错误。
```
```shell
#注释相关
:<<'
这是一段多行注释'

:<<!
这也可以是一段多行注释!

#如果在开发过程中，遇到大段的代码需要临时注释起来，过一会儿又取消注释，怎么办呢？每一行加个'#'符号太费力了，可以把这一段要注释的代码用一对花括号括起来，定义成一个函数，没有地方调用这个函数，这块代码就不会执行，达到了和注释一样的效果。
```



##  set 命令

`set`命令主要用来设置shell，在编写shell脚本时，使用`set`命令能设置shell的执行方式，根据需求不同，采用的参数设置也不同。`set`命令也用来显示系统中已存在的shell变量以及设置新的shell变量。

```shell
set     #显示环境变量
set -e  #只要脚本中发生错误，就停止执行并退出shell（否则虽然报错，但是依旧会继续运行
set -u  #如果遇到不存在的变量会报错并停止执行（否则不报错，也继续执行）
set -x 

## tips：set后的后缀改成+号则会关闭该功能。
```


