import UIKit

let defaults = UserDefaults.standard // A SingleTon
let session = URLSession.shared // Another SingleTon

/*
 Special about singletons is that there is only one copy of it that can be shared across all of your classes and objects.
 */

// Look at the case Below :


class Car{
    var color = "Red"
}


let myCar = Car();
myCar.color = "Yellow"
print(myCar.color) // it will print Yellow


let yourCar = Car();
print(yourCar.color) // It will print Red. Because every time when we init a new object, it creates a new object. And it holds the default value of Class.


/*
 But SingleTon is different. It doesn't create new copy. Rather it share the same copy across various class and struct.
 Let's see the following example.

 */


class Animal {
    var color = "Red"
    static var singleTon =  Animal()
}

/*
 Here singleTon variable is a Type property not instance property. it accessable using class name. No need to create any object. Most important thing is that there is only single copy which anyone can change.
 */


print(Animal.singleTon.color)


let myAnotherCar  = Animal.singleTon

myAnotherCar.color = "Blue"

print(myAnotherCar.color)

let yourAnotherCar = Animal.singleTon

print(yourAnotherCar.color) //This shows "Blue" at the output.



class A {
    init(){
        Animal.singleTon.color = "Black"
    }
}

class B {
    init(){
        print(Animal.singleTon.color)
    }
}

let objA = A()

let objB = B()
/*
 Output List : it shows Singleton works as a single copy which can be accessed and modified by anyone. Same Goes for userdefaults.standard / URLSession.shared 
 Yellow
 Red
 Red
 Blue
 Blue
 Black
 */




