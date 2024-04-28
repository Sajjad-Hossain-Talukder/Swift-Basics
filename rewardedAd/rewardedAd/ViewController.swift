//
//  ViewController.swift
//  rewardedAd
//
//  Created by Xotech on 28/04/2024.
//

import UIKit


class ViewController: UIViewController {
    
    private var rewardedAdHelper = RewardHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rewardedAdHelper.delegate = self
       
    }
    

    @IBAction func showAdPressed(_ sender: UIButton) {
        rewardedAdHelper.loadRewardedAd()
        rewardedAdHelper.show(vc: self )
        
    }
    
    @IBAction func showPopup(_ sender: UIButton) {
        
        print("showPopup")
        
        let storyboard = UIStoryboard(name: "Storyboard", bundle: nil)
        
        if let vc = storyboard.instantiateViewController(withIdentifier: "Popup") as? Popup {
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: true)
        }
     
        
    }
    
    
    
}

extension ViewController : rewardProtocol {
    func rewardUser() {
        print ( " get the reward ")
    }
    
    
}



