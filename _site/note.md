

# 如何使用Rbookdown写一本书

书网址：

> https://www.bookdown.org/
>
> https://pzhao.org/zh/post/bookdownplus-released/
>
> https://www.math.pku.edu.cn/teachers/lidf/docs/Rbook/html/_Rbook/index.html

## 安装设置

```R
#安装依赖包
install.packages("bookdown")
install.packages('servr')
install.packages("bookdownplus")
```

### R bookdownplus使用说明

安装完R bookdownplus后，进入一个目标文件夹（最好是空文件夹），生成模板文件，然后在模板文件的基础上进行改动。

```R
setwd()
bookdownplus::bookdownplus() 
```

改动完成后，打开bookdownplus.Rproj文件，键盘操作ctrl+shift+b进行编译即可。

以下是一些*R bookdownplus*制作模板或编译时用到的参数。

```R
#输出文件格式
bookdownplus(more_output = more_output())
### [1] "word_document2" "html_document2" "epub_book"      "gitbook"

#使用模板
bookdownplus(template = template())
##  [1] "article"         "article_mdpi"    "article_zh"     
##  [4] "calendar"        "chemistry"       "chemistry_zh"   
##  [7] "discussion"      "guitar"          "journal"        
## [10] "mail"            "nte_zh"          "poem"           
## [13] "thesis_classic"  "thesis_mypku_zh" "thesis_ubt"     
## [16] "thesis_zju_zh"   "yihui_demo"      "yihui_mini"     
## [19] "yihui_zh"        "poster"
```



### 其他模板

此外，[李东风](https://www.math.pku.edu.cn/teachers/lidf/docs/Rbook/html/_Rbook/bookdown.html)也提供了一些其他中文书模板（不依赖bookdownplus）：[`bookdown-template-v0-5.zip`](https://www.math.pku.edu.cn/teachers/lidf/docs/Rbook/html/_Rbook/bookdown-template-v0-5.zip)



## 文件结构

1. _bookdown.yml：book输出的文件名
2. **index.Rmd**：书的基本设置，YAML元数据
   - **书名、作者、时间**
   - site：必须要有，识别bookdown格式
   - **output**：默认输出格式`bookdown::gitbook/bookdown::word_document2`
   - documentclass：指定LaTeX的模板
   - **bibliography：参考文献库，文件路径**
3. **00intro.Rmd之类：章节主体内容，文件名需要按照章节顺序命名，前面最好加数字**
4. images：书本引用的图片
5. bib：参考文献库
6. style、tex：依赖文件
7. _bookdown_files：编译后书中图表的单独输出
8. **_book：成品**



## 一些使用说明

1. 用R作图时如果图形中有汉字， 在代码块选项中加上`dev="png", dpi=300`。 否则生成PDF时会有中文编码问题。 另一办法是在每个.Rmd文件开头的setup源代码段插入`pdf.options(family="GB1")​`，这样可以生成支持中文字的PDF图形。

2. 如果希望章节不在目录中出现，可以使用行尾标记`{-}`的方法。
3. 利用`\mainmatter`可以切换页码起始。



## 功能测试

1.代码：

```R
a <- 1:100
b <- rnorm(100,0,1)
plot(a+b)
```

2.公式

因子投资的基本公式：$$E(R_i^e)=\alpha_i+\beta'_i\lambda\tag{1}$$

均值-方差张成检验:

\begin{align}
\hat{\theta_K(r)}=\frac{\hat{\mu}_{tp}-r}{\hat{\sigma}_{tp}}\\s_1=max\frac{1+\hat{\theta}^2_{N+K}(r)}{1+\hat{\theta^2_K(r)}}-1\\s_2=min\frac{1+\hat{\theta}^2_{N+K}(r)}{1+\hat{\theta^2_K(r)}}-1
(\#eq:test2)
\end{align}

引用公式：\@ref(eq:test2)

3.书籍引用

用如：参见[@Wichmann1982:RNG]。

4.表格

col one      col two
----------- ----------
row 1.1     row 1.2
row 2.1     row 2.2

或者


```{r tab1, tidy=FALSE, echo=FALSE}
knitr::kable(
head(iris, 20), caption = 'Here is a nice table!',
booktabs = TRUE
)
```

表格引用：\@ref(tab:tab1)





**参考：**

1. [R-bookdownplus官方使用说明](https://bookdown.org/baydap/bookdownplus/quickstart.html#preparation)
2. [R语言教程-李东风（用Rbookdown制作图书）](https://www.math.pku.edu.cn/teachers/lidf/docs/Rbook/html/_Rbook/bookdown.html)
3. [R bookdown语法标记速查](https://pzhao.org/zh/post/bookdown-cheatsheet/)
4. [用 R Markdown 愉快地写作是怎样一种体验](https://slides.yihui.org/2016-China-R-bookdown-Yihui-Xie.html#(1))
5. 
