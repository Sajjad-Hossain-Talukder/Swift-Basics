//
//  Popup.swift
//  rewardedAd
//
//  Created by Xotech on 28/04/2024.
//

import UIKit

class Popup: UIViewController {
    
    @IBOutlet weak var cardView: UIView! {
        didSet {
            cardView.layer.cornerRadius = 20
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
