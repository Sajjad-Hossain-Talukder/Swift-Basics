//
//  ViewController.swift
//  CollectionViewDetails
//
//  Created by Xotech on 21/01/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var homeCollection: UICollectionView!
    
    @IBOutlet weak var collectionFlow: UICollectionViewFlowLayout!
    
    let img = ["pencil", "highlighter"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeCollection.dataSource = self
        homeCollection.delegate = self
        homeCollection.collectionViewLayout = collectionFlow
        homeCollection.backgroundColor = .blue
        
        collectionFlow.scrollDirection = .horizontal
        collectionFlow.itemSize = CGSize(width: 414, height: 761)
        collectionFlow.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }


}


extension ViewController : UICollectionViewDataSource , UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProjectCollectionViewCell
        cell.imageSet.image = UIImage(systemName: img[indexPath.row])
        cell.backgroundColor = .yellow
        return cell
    }
    
    
}


extension ViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = collectionView.bounds.width
        let h = collectionView.bounds.height
        
        print(w,h)
        
        return CGSize(width: w, height: h)
    }
}

