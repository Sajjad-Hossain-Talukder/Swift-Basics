//
//  ViewController.swift
//  SegueBasics
//
//  Created by Xotech on 17/01/2024.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func pressed(_ sender: UIButton) {
        performSegue(withIdentifier: "go", sender: self )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "go" {
            var secondVC = segue.destination as! SecondViewController
            if let sheet = secondVC.sheetPresentationController{
                sheet.detents = [ UISheetPresentationController.Detent.custom { context in
                    self.view.layer.frame.height * 0.509029
                }]
            }
        }
    }
    
    
}

