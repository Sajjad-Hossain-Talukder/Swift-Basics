

class Enemy {
    var weapon : Int
    var demage : Int
    
    init(_ weapon: Int,_ demage: Int) {
        self.weapon = weapon
        self.demage = demage
    }
    
    func demage(_ dem : Int ){
        weapon -= dem
    }
    
    func move() {
        print ("Walks Forward....")
    }
    
    func attack() {
        print ("Start Attack with \(weapon) weapons and make \(demage) demages ")
    }
}


struct Strk {
    var x : Int
    var y : Float
    
    mutating func demage(_ dem : Int ){
        x -= dem
    }
}


