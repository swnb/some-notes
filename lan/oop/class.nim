#nim

type 
    Human = object
        name: string
        age: int
    HumanRef=ref Human

proc getName(self:Human): string=
    return self.name

proc setAge(self:HumanRef,age:int)=
    self.age = age

proc getAge(self:Human):int=
    self.age
proc setName(self:HumanRef,name:string)=
    self.name=name

var human: Human

human.setName("zhang")

echo human.getName()