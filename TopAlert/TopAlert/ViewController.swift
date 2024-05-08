//
//  ViewController.swift
//  TopAlert
//
//  Created by Xotech on 06/05/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnShow: UIButton!{
        didSet{
            btnShow.addTarget(self, action: #selector(showAlert), for: .touchUpInside )
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
      
    }


    @objc func showAlert() {
    
        let centerX = view.frame.width / 2
            
          
        let alertViewWidth: CGFloat = 200
        let alertView = UIView(frame: CGRect(x: centerX - alertViewWidth/2, y: -100, width: alertViewWidth, height: 50))
        alertView.backgroundColor = UIColor.green
        alertView.layer.cornerRadius = 10
        
       
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: alertViewWidth, height: 50))
        label.text = "Copied to clipboard"
        label.textAlignment = .center
        label.textColor = UIColor.white
        alertView.addSubview(label)
    
        view.addSubview(alertView)

        
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            alertView.frame.origin.y = 50
        }) { (_) in
            // Once animation is complete, reverse the animation to dismiss the alert
            UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseInOut, animations: {
                alertView.frame.origin.y = -100
            }) { (_) in
                // Remove the alert view from the view hierarchy
                alertView.removeFromSuperview()
            }
        }
    }
}
