m11 = dofile("./m1.lua")
m11.fn()

m12 = loadfile("./m1.lua")
m12().fn()

m13 = require("m1.lua") -- this module must in package.path when you use require()
m13.fn()
