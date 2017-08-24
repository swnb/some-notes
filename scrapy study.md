# scrapy study 

## env config

### install scrapy

安装scrapy是很繁琐的，py的开发环境建议linux系统，本实例基于ubuntu16.10，注意不要使用`apt install python-scrapy`安装，因为有版本问题。安装方法如下两种

如果是pip安装，如果没有`pip`，请自行安装`setuptools`和 `pip`

```shell
pip install scrapy
```

如果用的是conda

```shell
conda install -c conda-forge scrapy
```

开发环境，因为笔者用的是vscode，专业pythoner还是pycharm吧

### vscode的python环境配置

vscode插件就选python即可

安装flask,代码检查

```shell
pip install flake8
```

安装yapf,代码格式化

```shell
pip install yapf
```

添加设置，使用快捷键  `ctrl`+`,`,在settings.json（用户设置）文件里面添加如下内容

```json
{
    "python.linting.pylintEnabled": false,
    "python.linting.flake8Enabled": true,
    "python.formatting.provider": "yapf",
    "python.formatting.formatOnSave": true  
}
```

意思是 禁用pylint 使用flake8 文件保存自动格式化

### startproject

建立工程文件

```shell
scrapy  startproject scrapytest
```

进入目录并且生成一个爬虫模板

```
cd scrapytest
scrapy genspider name example.com
```

解释一下 scrapy genspider 后面跟的两个参数 第一个是你定义的爬虫的名字 第二个是需要爬取的域名

之后在`./scrapy/spiders`目录下会生成一个文件，名字就是你定义的name

这个文件的代码如下

```python
import scrapy

class testSpider(scrapy.Spider):
    name = 'test'
    allowed_domains = ['qq.com']
    start_urls = ['http://www.qq.com/']
    def parse(self, response):
		pass
```

自己修改 `allowed_domains`  `start——urls` 为你想爬的域名和url

先简单来做一个测试

把最后一行的pass替换为

```python
width open('testforscrapy.html','wb') as f:
	f.write(response.body)
```

之后我们运行看一下

### run

运行有两种方法

一种在是shell里面进入工程文件目录后输入

```shell
scrapy crawl name
```

上面的name就是之前你自己定义的爬虫名字

还有一种就是自己写一个脚本运行

