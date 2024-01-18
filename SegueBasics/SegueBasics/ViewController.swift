//
//  ViewController.swift
//  SegueBasics
//
//  Created by Xotech on 17/01/2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var drawerHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if drawerHeightConstraint.constant > 0.0 {
            self.drawerHeightConstraint.constant = 0
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func toggleDrawer(_ sender: Any) {
        let newHeight: CGFloat
        if drawerHeightConstraint.constant > 0.0 {
            newHeight = 0
            
            print("height1 : ", view.layer.frame.height )
        } else {
            newHeight = view.layer.frame.height * 0.5034
            print("height : ", view.layer.frame.height )
        }
            
        UIView.animate(withDuration: 0.5 ) {
            print(newHeight)
            self.drawerHeightConstraint.constant = newHeight
            self.view.layoutIfNeeded()
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "goToTool" {
               var secondVC = segue.destination as! SecondViewController
               if let sheet = secondVC.sheetPresentationController{
                   let multiplier =  0.2
                   let height = self.view.frame.height
                  
                   let fraction = UISheetPresentationController.Detent.custom { context in
                       100
                    }
                  
                    sheet.detents = [fraction]
               }
               
               
              // present(secondVC, animated: true , completion: nil )
           }
       }
    
}

