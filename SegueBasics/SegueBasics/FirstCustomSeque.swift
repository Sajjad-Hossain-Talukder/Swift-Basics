//
//  FirstCustomSeque.swift
//  SegueBasics
//
//  Created by Xotech on 17/01/2024.
//

import UIKit

class FirstCustomSeque: UIStoryboardSegue {
    override func perform() {
           // Declare the INITAL view and the DESTINATION view
           // This will break and be nil if you don't have a second view controller for your DESTINATION view
        let initalView = self.source.view as UIView?
        let destinationView = self.destination.view as UIView?

           // Specify the screen HEIGHT and WIDTH
        var screenHeight = UIScreen.main.bounds.size.height
        var screenWidth = UIScreen.main.bounds.size.width

           // Specify the INITIAL PLACEMENT of the DESTINATION view
        //initalView?.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
       // destinationView?.frame = CGRect(x: 100 , y: 0, width: 100 , height: 100)
        
        
        
           // Access the app's key window and add the DESTINATION view ABOVE the INITAL view
       // let appWindow = UIApplication.shared.keyWindow
       // appWindow?.insertSubview(destinationView!, aboveSubview: initalView!)

           // Animate the segue's transition
        UIView.animate(withDuration: 0.4, animations: {
               // Left/Right
               initalView?.frame = (initalView?.frame.offsetBy(dx: 0, dy: 0))!
               destinationView?.frame = (destinationView?.frame.offsetBy(dx: 0 , dy: -screenWidth))!
           }) { (Bool) in
              // self.source.present(self.destination, animated: true , completion: nil)
               
//               if let sheet = self.destination.presentingViewController?.sheetPresentationController{
//                   let multiplier =  0.6 // 0.450893
//                   let height = self.destination.view.safeAreaLayoutGuide.layoutFrame.size.height
//                   if #available(iOS 16.0, *) {
//                       let fraction = UISheetPresentationController.Detent.custom { context in
//                           height * multiplier
//                       }
//                       sheet.detents = [fraction]
//                   }
//               }
              // self.destination.view.frame =  CGRect(x: 100 , y: 100 , width: 100 , height: 200)
               //destinationView?.frame =  CGRect(x: 0, y: 0, width: 100 , height: 200)
               self.source.present(self.destination, animated: true , completion: nil)
               
           }
       }
}
