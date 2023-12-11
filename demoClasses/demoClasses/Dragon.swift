
class Dragon : Enemy  {
    var wing = 5
    
    override func move() {
        print("Flies forward.....")
    }
    override func attack() {
        super.attack()
        print ("Destroy the houses = \(wing) and factories = \(demage)")
    }
    func play(){
        print("Play Accessed")
    }
}
