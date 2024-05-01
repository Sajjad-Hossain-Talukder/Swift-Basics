//
//  ViewController.swift
//  LottieProject
//
//  Created by Xotech on 02/05/2024.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    @IBOutlet weak var aView: AnimationView!{
        didSet{
            aView.animation = Animation.named("lottie")
            aView.loopMode = .loop
            aView.play()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
  


}

