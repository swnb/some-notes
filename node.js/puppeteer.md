# puppeteer

这是一个无界面chrome的调试工具

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

下面来看一些有意思的事情
将es6的教程用web爬虫抓取下来

```javascript
const puppeteer = require('puppeteer')

function errHandle(err) {
    console.log(`err-->> ${err}`)
}

const main = async () => {
    const browser = await puppeteer.launch({
        headless: true
    })
    const page = await browser.newPage()
        .catch(errHandle)
    await page.goto('http://es6.ruanyifeng.com/')
        .catch(errHandle)
    await page.waitForSelector('#sidebar > ol > li > a')
        .catch(errHandle)
    const eles = await page.$$eval('#sidebar > ol > li > a', ele => [...ele].map(ele => ({
        link: ele.href,
        tag: ele.innerText
    }))).catch(errHandle)
    eles.shift()
    let count = eles.length
    eles.forEach(async (ele, i) => {
        const newPage = await browser.newPage()
            .catch(errHandle)
        await newPage.goto(ele.link)
            .catch(errHandle)
        await newPage.waitForSelector('#content-toc')
            .catch(errHandle)
        await newPage.pdf({
            path: `./pics/第${i+1}章节->${ele.tag}.pdf`,
            printBackground: true
        }).catch(errHandle).then(async () => {
            console.log(`finish num[${i}] name ${ele.tag}`);
            if (--count === 0) {
                await browser.close()
            }
        })
    })
    await page.screenshot({
        path: './tmp.png'
    }).catch(errHandle)
    await page.close()
}


module.exports = main

几个api需要知道

`page.waitForSelector()`等待渲染到选择的节点出现, 或者延迟30秒后爆出异常
`page.$$eval()`返回 `document.querySelector()`的选择
`page.pdf()`需要设置 `printBackground: true`来实现背景渲染
