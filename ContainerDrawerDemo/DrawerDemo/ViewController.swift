//
//  ViewController.swift
//  DrawerDemo
//
//  Created by Barbara on 14.11.18.
//  Copyright © 2018 Barbara Reichart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var drawerHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func toggleDrawer(_ sender: Any) {
        let newHeight: CGFloat
        if drawerHeightConstraint.constant > 0 {
            newHeight = 0
        } else {
            newHeight = view.layer.frame.height * 0.5033479928970337
        }
            
        UIView.animate(withDuration: 0.1 ) {
            self.drawerHeightConstraint.constant = newHeight
            self.view.layoutIfNeeded()
        }
    }
    
}

