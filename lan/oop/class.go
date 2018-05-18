//golang
package oop

type Human struct {
	name string
	age  int
}

func (self *Human) getName() string {
	return self.name
}

func (self *Human) setAge(age int) {
	self.age = age
}
