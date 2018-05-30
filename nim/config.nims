switch("threads","on")
task(build,"build nim files"):
    exec("nim c -r ./example.nim")
    setCommand("nop")