配置Vim，适合在Windows下开发大型C语言工程
============

2013.11.25
1. 参考网上使用cscope+NERDTree的插件组合
2. 使用pathogen插件管理


有三个参考文档

第一篇《VIM自给自足, SOURCEINSIGHT + VIM》,http://hi.baidu.com/pjg864/item/3d974131d7cc95c31a969670
a) 让我产生了配置vim像Source Insight。
b) 在按照这篇文章安装NERDTree的时候，安装手册建议使用pathogen来安装。
c) 这个文档附上了作者的project.vim, start.bat文件，有了一个“工程”的入口。

第二篇《改造vim变成source insight》，http://qiweiyou1982.blog.163.com/blog/static/14164218620132112548476/
a) 让我知道了SrcExpl插件，预览功能也有了。
b) 使用Trinity插件把taglist，SrcExpl，NERDTree插件整合在一起使用。

第三篇《Vim+cscope+ctags+tags阅读源代码》，http://zhwen.org/?p=articles/cscope-tags
a) cscope和ctags两个工具的用法

2014.1.8 增加Windows下使用方法

1. 找到C:\Program Files\Vim   (x64是C:\Program Files (x86)\Vim, 或vim其它安装位置)

2. 删除文件夹vimfiles         (会删除之前vim所有配置，请自己备份)

3. 把本工程中vimfiles放在1位置

4. 在C:\Program Files\Vim\vimrc文件末尾添加source $VIM/vimfiles/_vimrc

5. 把need_add_to_path目录下的所有文件放到C:\Windows目录下
