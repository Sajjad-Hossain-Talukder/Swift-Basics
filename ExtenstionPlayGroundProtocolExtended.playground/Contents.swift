

protocol CanFly {
    func fly()
}

extension CanFly {
    func fly() {
        print("This object can fly.")
    }
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
    
    func fly() {
        print("Eagle can fly with wings ")
    }
    func prey() {
        print("Eagle can prey" )
    }
}


class Pen : Bird {
    var walkingDist : Int = 0
}

struct Aeroplane : CanFly {
}


struct FlyingMuseum {
    func flyingObject(_ obj: CanFly ){
        obj.fly()
    }
}


print ("Eagle part  : ")
let myEagle = Egale()
myEagle.prey()
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
