//
//  ViewController.swift
//  PresentView
//
//  Created by Xotech on 06/05/2024.
//

import UIKit

protocol NotifyDelegate {
    func NotifyTheBoys(state:Bool)
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print ( " viewDidLoad => " , Global.isPremium )
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print ( " viewWillAppear => " , Global.isPremium  )
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print ( " viewDidAppear => " , Global.isPremium  )
    }

    @IBAction func btnPresent(_ sender: UIButton ) {
        
        print ( "btnPresent => ", Global.isPremium )
        
        let storyboard = UIStoryboard(name: "IAP", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "IAPVC") as? IAPVC {
            vc.modalPresentationStyle = .overCurrentContext
            vc.delegate = self
            self.present(vc, animated: true)
        }
        
        
        
    }
    
    @IBAction func btnCheck(_ sender: UIButton) {
        
        print( "btnCheck => " , Global.isPremium )
    }
}



extension ViewController  : NotifyDelegate {
    func NotifyTheBoys(state: Bool) {
        print ( "Got it \(state)")
    }
    
    
}
