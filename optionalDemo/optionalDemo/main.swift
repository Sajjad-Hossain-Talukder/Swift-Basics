//
//  main.swift
//  optionalDemo
//
//  Created by Xotech on 10/12/2023.
//
//
//import Foundation
//var  opt : String?
//
//opt = nil
//
//
//if opt != nil {
//    print( opt )
//} else {
//    print ( " Sorry Okay " )
//}
//
//if var x = opt {
//    print ( x )
//} else {
//    print (" Hey ")
//}
//
//
//
//print ( opt ?? " Hola ")


struct MyOptional{
    
    var xx = 2234
    func met()->String{
        return " Ore Mama " ;
    }
}


var vari : MyOptional? = MyOptional()

print( vari?.xx ?? "Akhil" )

var x = vari?.met() ?? "hola"


