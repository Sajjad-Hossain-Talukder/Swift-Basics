////import UIKit
////
//////print("Sajjad Hossain Talukder")
////
////
//////func loveCalculator1(){
//////    var loveScore = Int.random(in: 0...100)
//////    
//////    if loveScore == 100 {
//////        print("Hurrah!!")
//////    } else {
//////        print("Alone forever!!!")
//////    }
//////}
////
////
////func loveCalculator2(){
////    var loveScore = Int.random(in: 0...100)
////    
////    switch loveScore {
////        
////    case 81...100 :
////        print("Absolutely Fantastic")
////    case 40...80 :
////        print("Not Bad")
////    default:
////        print("Very Bad")
////    }
////    
////}
////
////
////loveCalculator2()
//
//

struct Employee {
    
    let name : String
    let email : String?
    let moblie : String
    var skills : [String]
    var nProb : Int
    var icpc : Bool
    
    var devices: [String:Int]
    
//    init(name: String, email: String?, moblie: String, skills: [String], nProb: Int, icpc: Bool, devices : [String:Int ]) {
//        self.name = name
//        self.email = email
//        self.moblie = moblie
//        self.skills = skills
//        self.nProb = nProb
//        self.icpc = icpc
//        self.devices = devices
//    }
    
    
    func howManySolve() -> Int {
        return self.nProb;
    }
    
    func participateIcpc() -> Bool {
        return self.icpc;
    }
    
    mutating func showSkill() {
        devices["Mobile"] = 45
        print("Skills of \(name) are ",separator: " ")
        for x in skills {
            print(x,separator: " ")
        }
    }
    
    
}




var em1 = Employee(name: "Sajjad", email: "mail", moblie: "01871156068", skills: ["Competitive Programmer", "iOS Developer", "Swift" , "DB"], nProb: 1200 , icpc: true, devices:["Mobile":5, "Laptop":2,"Headphone":3] )

var em2 = Employee(name: "Tanvir", email:"", moblie: "0187", skills: ["Computer Operator", "Problem Solving"], nProb: 0 , icpc: false ,devices:["Mobile":12, "Laptop":1,"Headphone":31])


em2.howManySolve()
em2.participateIcpc()
print(em1.devices["Mobile"])
em1.showSkill()
//print("sa")
em2.skills.append("Business Case Analysis")
em1.howManySolve()
print(em1.devices["Mobile"])
em1.devices["Mobile"] = 100

print(em1.devices["Mobile"])



em2.howManySolve()
em2.showSkill()
//
//
//
//

//
//func greet(_ name: String, from hometown: String) {
//    print("Hello \(name)! Welcome from \(hometown).")
//}
//
//// Calling the function using external parameter names
//greet("Alice", from: "New York")



//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
