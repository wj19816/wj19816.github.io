# Linix 系统使用screen命令



```bash
yum install screen #安装

screen -S wj  #新建一个窗口
screen -ls    #查看所有的窗口

screen -r wj   #恢复窗口

Ctrl + a，a #切换会话
Ctrl + a，d #暂离当前会话
Ctrl + a，c #在当前screen会话中创建一个子会话
Ctrl + a，w #子会话列表
Ctrl + a，p #上一个子会话
Ctrl + a，n #下一个子会话
Ctrl + a，0-9 #在第0窗口至第9子会话间切换

```



 ![image-20201103141055429](/Users/didi/Library/Application Support/typora-user-images/image-20201103141055429.png)

![image-20201103141117364](/Users/didi/Library/Application Support/typora-user-images/image-20201103141117364.png)



- kill窗口

```bash
#detach会话
Ctrl+A+D 

#不在会话内
screen -d session_id   # eg：screen -d 001

screen -X -S wangjing quit
# eg：screen -X -S 001 quit
```

