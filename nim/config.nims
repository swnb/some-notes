switch("threads","on")
task(build,"build nim files"):
    exec("nim c -r ./test.nim")
    setCommand("nop")