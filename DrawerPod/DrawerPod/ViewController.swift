//
//  ViewController.swift
//  DrawerPod
//
//  Created by Xotech on 07/03/2024.
//

import UIKit
import drawer_view

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        

        let drawerView = DrawerView(topLayoutGuidePadding:500, closedHeight: 500, superView: view)
        drawerView.change(state: .closed , shouldAnimate: true  )
    
    }
    


}

