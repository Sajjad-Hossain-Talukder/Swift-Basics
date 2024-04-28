//
//  gridCell.swift
//  ListGridTransitionPod
//
//  Created by Xotech on 04/04/2024.
//

import UIKit

class gridCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 16
    }

}
