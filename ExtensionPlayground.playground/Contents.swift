import UIKit

var pi = 3.14159

pi.round()


/*
 We can extended all oper-source and close-source type in Swift . Like Double is open source but UIButton is close source. But we cam extend both
 
 Extension Syntax:
 
 extension Datatype {
 
    statements - Add new functionality in function format
 
    func newFunctionality () {
        var n = self
    }
 
 }
 
 */



extension Double {
    func round( to place : Int ) -> Double {
        var n = self
        let multiplier = pow( 10 , Double(place))
        n *= multiplier
        n.round()
        n /= multiplier
        return n
    }
}


var piAgain = 3.14159

var roundedToPlace = piAgain.round(to: 3)
print(roundedToPlace)

var roundedToPlace1 = piAgain.round(to: 1)
print(roundedToPlace1)

var roundedToPlace2 = piAgain.round(to: 4)
print(roundedToPlace2)

// Extending UIBUtton

var btn : UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))



extension UIButton {
    func roundedButton(){
        self.backgroundColor = .red
        self.layer.cornerRadius = 25
        self.clipsToBounds = true
    }
}

btn.roundedButton()







