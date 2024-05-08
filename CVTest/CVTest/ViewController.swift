//
//  ViewController.swift
//  CVTest
//
//  Created by Xotech on 08/05/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var CV: UICollectionView!
    @IBOutlet weak var CVFlow: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CV.delegate = self
        CV.dataSource = self
        CV.clipsToBounds = false
        CV.contentMode = .center
        CV.register(
            UINib(
                nibName: "firstType" , bundle: nil),
            forCellWithReuseIdentifier:  "firstType" )
        CV.register(
            UINib(
                nibName: "secondType" , bundle: nil),
            forCellWithReuseIdentifier:  "secondType" )
        CVFlow.minimumLineSpacing = 0
        CVFlow.minimumInteritemSpacing = 0
    }


}

extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
          return 2
      }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("section => \(section) ")
        if section == 0 {
            return 1
        } else {
            return 14
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "firstType", for: indexPath ) as! firstType
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "secondType", for: indexPath ) as! secondType
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            
            return CGSize(width: 414, height: 400 )
        }
       
        return CGSize(width:  172  , height: 172 )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            if section == 1 {
                return UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20)
            } else {
                return UIEdgeInsets.zero
            }
        }

    
    
}

