---
layout: post
title: 'Jekyll:如何将_post以外的文章标签加入标签系统'
date: 2020-10-11
permalink: /posts/jekyll-plugins
tags:
- 工具
- 安装
- 博客

---

<!-- more -->



# 起因：

由于之前为了方便管理，把文章根据内容分在了不同文件夹中，这样就导致其他文件夹下的文章标签无法被识别，只能单独新建一个隐藏md文件存所有的标签，但是这样就没法很好使用*tag cloud*的功能（且麻烦☹️）。

因此，还是需要从根本上去修改。



查了很多资料，发现源头是因为：**jekyll中默认的`site.tags`变量只能识别`_post`文件夹下的文章**，但是没找到地方修改。

最后找到一篇文章，通过`plugins`的方法来解决。

感谢：

> 参考：[jekyll plugin， 重写 site.categories / site.tags ，将 page 的 categories & tags 收纳进来。](https://blog.csdn.net/NetMicrobe/article/details/80761727)



（其实步骤超级简单，但是之前没找到方法真的卡了好久QAQ）

# 安装步骤：

> 参考：[jekyll 官方插件文档](https://jekyllcn.com/docs/plugins/)

1. 在网站根下目录建立 `_plugins` 文件夹。 Jekyll 运行之前，会加载此目录下所有以 `*.rb` 结尾的文件

2. 在 `_plugins` 文件夹下新建`gather_cates_tags.rb`文件。插入代码：

   ```ruby
   module Jekyll
     class Site
       
       # 
       # 将其他 colleciton 中 document 排入 site.categories
       # 
       def categories_with_pages
         # 获取 _posts 的 categories， jekyll 自带
         cates = categories_without_pages
         
         # 将其他 colleciton 中 document 排入 site.categories
         collections.each do |k, v|
           next if k == 'posts'
           v.docs.each do |doc|
             # Add doc into categories
             if doc.data['categories']
               doc.data['categories'].each do |cate|
                 # category 可以支持 utf-8 中文，在模板中使用 ['chinese-cate']的方式引用
                 # 例如： 
                 cates[cate.force_encoding('utf-8')] << doc
               end
             end
           end
         end
         
         cates
       end
       
       alias_method :categories_without_pages, :categories
       alias_method :categories, :categories_with_pages
       
       #
       # 将其他 colleciton 中 document 排入 site.tags
       #
       def tags_with_pages
         # 获取 _posts 的 tags， jekyll 自带
         tags = tags_without_pages
         collections.each do |k, v|
           next if k == "posts"
           v.docs.each do |doc|
             if doc.data['tags']
               doc.data['tags'].each do |t|
                 tags[t.force_encoding('utf-8')] << doc
               end
             end
           end
         end
         
         tags
       end
       
       alias_method :tags_without_pages, :tags
       alias_method :tags, :tags_with_pages
     end
   
   end
   ```

3. 完成！👏