//
//  main.swift
//  ProtocolDemo
//
//  Created by Xotech on 11/12/2023.
//
/*

class Bird {
    var isFemale = true
    
    func layEgg(){
        if isFemale {
            print( "Bird lays egg and continue generating New Generation")
        }
    }
    
    func fly (){
        print("Birds Fly in the Sky")
    }
    
}

class Egale : Bird {

    func foar() {
        print("Eagle can foar" )
    }
}


class Pen : Bird {
    override func fly() {
        print("Pen can't fly ")
    }
}
 
class Aeroplane : Bird {
     ??? WTF - Aeroplane don't lay Egg
}

struct FlyingMuseum {
    func flyingObject(_ obj: Bird ){
        obj.fly()
    }
}

let myEagle = Egale()
print ("Eagle part  : ")
myEagle.foar()
myEagle.fly()
myEagle.layEgg()
print( myEagle.isFemale )

print ("Penguine part  : ")
let myPen = Pen()
myPen.fly()
myPen.layEgg()


print("Struct part : ")
var flyMuseum = FlyingMuseum()
flyMuseum.flyingObject(myEagle)
flyMuseum.flyingObject(myPen)

*/
/*
 Problem arise when we want to contruct a Aeroplane which can fly but not the same way as Birds. Same way, Aeroplane doesn't lay any eggs.
 And most important part is we want Aeroplane as struct
 
 On the otherhand, Penguine do not fly but it needed to provide a override implementation for fly()
 
 */


// Solved Problem using Protocols //
 


protocol CanFly {
    func fly()
    func swim()
}


class Bird {
    var isFemale = true
    
    func layEgg(){
        if isFemale {
            print( "Bird lays egg and continue generating New Generation")
        }
    }
}

class Egale : Bird, CanFly {
    
//    func fly() {
//        print("Eagle can fly with wings ")
//    }
//    func foar() {
//        print("Eagle can foar" )
//    }
}


class Pen : Bird {
    var walkingDist : Int = 0
}

struct Aeroplane : CanFly {
//    func swim() {
//        <#code#>
//    }
//    
//    func fly() {
//        print("Aeroplane use Engine to fly")
//    }
}


struct FlyingMuseum {
    func flyingObject(_ obj: CanFly ){
        obj.fly()
    }
}

let myEagle = Egale()
print ("Eagle part  : ")
myEagle.foar()
myEagle.fly()
myEagle.layEgg()
print( myEagle.isFemale )

print ("Penguine part  : ")
let myPen = Pen()
myPen.layEgg()


let aeroPlane = Aeroplane()

print("Struct part : ")
var flyMuseum = FlyingMuseum()
flyMuseum.flyingObject(myEagle)
flyMuseum.flyingObject(aeroPlane)

