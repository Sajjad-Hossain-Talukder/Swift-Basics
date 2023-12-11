//
//  main.swift
//  ProtocolDemo
//
//  Created by Xotech on 11/12/2023.
//


class Bird {
    var isFemale = true
    
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
        super.fly()
        print("Pen can't fly ")
    }
}

let myEagle = Egale()

//myEagle.foar()
//myEagle.fly()
//print( myEagle.isFemale )


let myPen = Pen()


myPen.fly()


 
