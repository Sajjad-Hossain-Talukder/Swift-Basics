import UIKit

var greeting = "Hello, playground"


print(greeting)

let defaults = UserDefaults.standard


defaults.setValue("Arman Brother", forKey: "stringSaved")
defaults.setValue(["Arman Brother","Shakib","Mashrafi"], forKey: "teamPlayer")

let stringSaved = defaults.string(forKey: "stringSaved")!
let team = defaults.object(forKey: "teamPlayer") as! [String]
let dictionary : [String:Any] = ["name" : "Sajjad Hossain Talukder" , "Age" : 24 ,  "Unibersity" : "PUC" , "CGPA" : 2.56 ]
defaults.setValue(dictionary, forKey: "mySelf")
let mySelf = defaults.object(forKey: "mySelf") as! [String:Any]

print(stringSaved)
print(team)
print(mySelf["name"])




