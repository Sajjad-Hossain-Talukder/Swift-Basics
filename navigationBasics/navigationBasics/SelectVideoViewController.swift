//
//  SelectVideoViewController.swift
//  navigationBasics
//
//  Created by Xotech on 21/03/2024.
//

import UIKit

class SelectVideoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        let crossButton = UIButton(type: .custom)
        let crossImage = UIImage(systemName: "xmark")?
            .withTintColor(.white, renderingMode: .alwaysOriginal)
        
        crossButton.setImage(crossImage, for: .normal)
        
        
        crossButton.addTarget(
            self,
            action: #selector(crossButtonTapped),
            for: .touchUpInside
        )
        
        
        let crossBarButtonItem = UIBarButtonItem(customView: crossButton)
        
        navigationItem.rightBarButtonItem = crossBarButtonItem
        
        

        
    }
    
    @objc func crossButtonTapped() {
      //performSegue(withIdentifier: "videoToHome", sender: self)
        print("crossButtonTapped")
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
