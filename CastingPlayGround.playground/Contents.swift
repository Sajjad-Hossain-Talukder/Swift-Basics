import Foundation


class Animal {
    func hasLife(){
        print("All animal has life.....")
    }
}


class Human : Animal {
    func code() {
        print("Human Do Code......")
    }
}

class Tiger : Animal {
    func smellMeat(){
        print("Tiger can smell ")
    }
}


class Dog : Animal {
    func bark(){
        print("Dog barkes")
    }
}


let sajjad = Human()
let arman = Human()

let tomDog = Dog()
let robertTiger = Tiger()
 



let animalArray = [sajjad,arman,tomDog,robertTiger]  // This is a valid array as all the object inherit same Class [Animal]

let arrayComponent = animalArray[0]   // This is a Animal Class Object . Though it is "sajjad" which is Human class object but it upcasted.


if arrayComponent is Human {  // is used for type comparision . == operator failed here
    print("Object Belongs to Human Class ")
}


for comp in animalArray {
    if comp is Dog {
        print("Got a Dog")
        
        // comp.bark() - this function won't work here Though we detected it as Dog. Because it's already Up-Casted
        // To accesss Dog.bark(() - We need to do DownCast - (as!) used for force DownCasting
        // (as?) return optional casting - Which is safer
        
        let dogObj = comp as! Dog
        dogObj.bark()
        
        
        
        if let doggy = comp as? Dog {
            doggy.bark()
        }
        
        
    }
}


// (as) used for upcasting . Let's say , I want to make "sajjad" to Animal class . How do we do that ?


let animalSajjad = sajjad as Animal

if animalSajjad is Animal {
    print("Object Belongs to Animal class not Human Class anymore ")
}



/*
 Let's Discuss About Any? , AnyObject? NSObject ?
 Any - any obejct belongs to any Struct or Class
 AnyObject = any object belongs to any Class
 NSObject = any object belongs to Foundation Class
 */

struct Sports{
    func howToPlay(){
        print("I Don't know. Implement your Own")
    }
}

let cricket = Sports()

let makeArrayOfAllType :[Any] = [cricket,sajjad,tomDog,robertTiger] // Valid Line as it has Any type . Struct and Class both are accepted


// let makeArrayOfAllType :[AnyObject] = [cricket,sajjad,tomDog,robertTiger] // Invalid - because it receives only Class Object - cricket is a Struct object
let makeArrayOfAnyObject :[AnyObject] = [sajjad,tomDog,robertTiger]  // Now this is valid


let num : NSNumber = 56
let word : NSString = "Hola"

let makeArrayOfNSType : [NSObject] = [num,word] // valid though different type as all are NS Object
