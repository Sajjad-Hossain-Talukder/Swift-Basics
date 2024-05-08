//
//  IAPVC.swift
//  PresentView
//
//  Created by Xotech on 06/05/2024.
//

import UIKit

class IAPVC: UIViewController {
    
    var delegate : NotifyDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    @IBAction func btnMakePRemium(_ sender: UIButton) {
        Global.isPremium.toggle()
        print ( " btnMakePremium => " ,  Global.isPremium )
        
    }
    
    
    @IBAction func btnDismiss(_ sender: UIButton) {
        //delegate?.NotifyTheBoys(state : Global.isPremium)
        print ( " btnDismiss => "  , Global.isPremium )
        dismiss(animated: true) {
            self.delegate?.NotifyTheBoys(state : Global.isPremium)
        }
    }
    

}
