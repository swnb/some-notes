import future
import strutils
import sequtils
import os

var a = "asabda"
echo a.to_upper_ascii()

proc showNumber(num: int|float)=
    debugEcho num

# proc concat(a:string):auto=
#     "hello "&a
        
show_Number(11.12)



proc fn=
    echo 1


proc fn(age:int)=
    echo age
proc fn(name:auto):auto=
    echo name
    result=name

fn(11)
discard fn("name")
fn()

var numbers = @[1,2,3,4,5]
echo filter(numbers,proc (ele:int):bool=ele mod 2 != 0)

echo filter(numbers,(x:int)->bool=>x mod 2!=0)
echo filter(numbers,x=>x mod 2!=0)



proc fn(val:auto,vail:(x:int)->bool)=
    if vail(val):echo val
    else:echo "wrong type"

proc vail(x:auto):bool=
    if x>10:
        return true
    else:
        return false

fn(111,vail)

var arr: array[3,int]
arr[0]=1
arr[1]=2
echo arr.repr

var arr1 : array[-10 .. -9,int]
arr1[-10]=1
arr1[-9]=12
echo arr1


var lists=["a","b","c"]
for item in lists:
    echo item

for i in lists.low..lists.high:
    echo lists[i]

var seqs:seq[int]= @[]
seqs.add(10)
var seqss: seq[int]

assert seqss == nil

echo seqs.len


for i in 0..<seqs.len:
    stdout.write seqs[i]


var sets: set[int16]
assert sets=={}

let collections = {'a'}

var setss = {'a'}

assert collections == setss

var aa = 2

case aa:
    of 0..10:
        echo 11
    of 211..23332:
        echo 12
    of 14..23:
        echo 13
    else:
        echo 14

var itit :auto= @[1,2,3,4,5,5,6,7,8,9]

iterator arriter(arr: seq[int]): auto=
    var i: int
    while i < arr.len:
        yield arr[i]
        inc i

for x in arriter(itit):
    echo x

var aaa : tuple[x,y: int]

type 
    aaaa = tuple[x,y:int]


aaa= (x:10,y:22)

let asads:aaaa=(23,32)
let asasa:aaaa=(x:32,y:32)

let (x,_)=asads
let (_,y)=asads
echo x,y

let data="threads"

proc change(param:string)=
    for i in 0..<param.len:
        echo param[i]

var thread:array[2,Thread[string]]

createThread(thread[0],change,data)

createThread(thread[1],change,data)

joinThreads(thread)
