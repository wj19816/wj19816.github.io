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