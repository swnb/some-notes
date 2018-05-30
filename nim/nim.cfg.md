如何编写一个配置文件，不需要 nim.cfg
建议使用 config.nims 来编写配置文件

如果要开启某个功能`switch("threads","on")`
编写一个脚本

```nim
task(command,"run command for you work"):

    exec("nim c -r ./index.nim")

    setCmmand("nop")
```

这样的配置文件是很便捷的，只需要在这个文件目录下写入`nim command`就行了
