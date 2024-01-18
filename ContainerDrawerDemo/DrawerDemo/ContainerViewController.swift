//
//  ContainerViewController.swift
//  DrawerDemo
//
//  Created by Xotech on 18/01/2024.
//  Copyright © 2024 Barbara Reichart. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        topView.layer.cornerRadius = 20
    }
    

}
