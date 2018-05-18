//javascript

// class Human {
//     name = ''
//     age = 0
//     getName() {
//         return this.name
//     }
//     setAge(age) {
//         this.age = age
//     }
// }

//标准

//getter setter

class Human {
    constructor(name = '', age = 0) {
        this.name = name
        this.age = age
    }
    set name(name) {
        this._name = name
    }
    get name() {
        return this.name
    }
    set age(age) {
        console.log('setting age')
        this._age = age
    }
    get age() {
        return this._age
    }
    static create() {
        return new Human()
    }
}


const human = Human.create()

human.age = 1100
console.log(human.age)