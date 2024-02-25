//
//  ViewController.swift
//  PlayingWIthViews
//
//  Created by Xotech on 20/02/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var collectionFlow: UICollectionViewFlowLayout!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.dataSource = self
        collection.delegate = self
        
        collection.dataSource = self
        collection.delegate = self
        collection.collectionViewLayout = collectionFlow
        
        
        collection.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        collection.register(UINib(nibName: "CollectionViewCellTwo", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCellTwo")
        
        
        collectionFlow.scrollDirection = .horizontal
        collectionFlow.collectionView?.showsVerticalScrollIndicator = false
        collectionFlow.collectionView?.showsHorizontalScrollIndicator = false
        collectionFlow.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionFlow.minimumLineSpacing = 0
        collectionFlow.minimumInteritemSpacing = 0
        
       
    }


    @IBAction func buttonIsTapped(_ sender: UIButton) {
        
        
        let appStoreLink =  "https://apps.apple.com/us/app/photomator-photo-editor/id1444636541"
       
        if let url = URL(string: appStoreLink), UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                print("Invalid URL or unable to open the link.")
            }
    }
    
    
}



extension ViewController : UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellTwo", for: indexPath) as! CollectionViewCellTwo
        return cell
        
        //https://www.apple.com/ https://apps.apple.com/us/app/photomator-photo-editor/id1444636541
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let h = view.frame.size.height
        let w = view.frame.size.width
        
        print(h,w,h*0.804687)
        
        
        return CGSize(width: w, height: h*0.80)
        
        
        
    }
    
    
}

