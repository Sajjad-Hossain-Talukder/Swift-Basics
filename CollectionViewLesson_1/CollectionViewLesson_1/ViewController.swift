//
//  ViewController.swift
//  CollectionViewLesson_1
//
//  Created by Xotech on 24/06/2024.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    let colors = [UIColor.black,UIColor.brown,UIColor.blue]

    @IBOutlet weak var cv: UICollectionView!{
        didSet{
            
            let layout = UICollectionViewFlowLayout()
            
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
         
            cv.collectionViewLayout = layout
            
            cv.isPagingEnabled = true
            cv.contentInsetAdjustmentBehavior = .never
            cv.showsHorizontalScrollIndicator = false
            
            cv.register(UINib(nibName: "first", bundle: nil), forCellWithReuseIdentifier: "first" )
            
            
            cv.dataSource = self
            cv.delegate = self
           
           
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return 3
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "first", for: indexPath) as! first
           
           cell.vw.backgroundColor = colors[indexPath.row]
           
           return cell
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
       }


}

