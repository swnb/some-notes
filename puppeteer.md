# puppeteer

这是一个chrome的调试工具，可以实现截图的功能

代码如下

```javascript
const puppeteer=require('puppeteer')
!(async ()=>{
    const browser=await puppeteer.launch()
    const page=browser.newPage()
    await page.goto(url)
  	await page.screenshot({path:'./png'})
  	browser.close()
})
```

