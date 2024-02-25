//
//  ViewController.swift
//  PlayingWithTransition
//
//  Created by Xotech on 25/02/2024.
//

import UIKit
import DisplaySwitcher


class ViewController: UIViewController{
    
    
    private lazy var listLayout = DisplaySwitchLayout(staticCellHeight: 104, nextLayoutStaticCellHeight: 212, layoutState: .list)
    
    private lazy var gridLayout = DisplaySwitchLayout(staticCellHeight: 212, nextLayoutStaticCellHeight: 104, layoutState: .grid)
    
    
    
    
    
    private var layoutState: LayoutState = .list
    
    
    private lazy var listCVLayout: UICollectionViewFlowLayout = {
        
        let collectionFlowLayout = UICollectionViewFlowLayout()
        collectionFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        collectionFlowLayout.itemSize = CGSize(width: 414, height: 80)
        collectionFlowLayout.minimumInteritemSpacing = 10
        collectionFlowLayout.minimumLineSpacing = 10
        collectionFlowLayout.scrollDirection = .vertical
        return collectionFlowLayout
    }()
    
    private lazy var gridCVLayout: UICollectionViewFlowLayout = {
        
        let collectionFlowLayout = UICollectionViewFlowLayout()
        collectionFlowLayout.scrollDirection = .vertical
        collectionFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        collectionFlowLayout.itemSize = CGSize(width: (414 - 80) / 2 , height: 896/8)
        collectionFlowLayout.minimumInteritemSpacing = 10
        collectionFlowLayout.minimumLineSpacing = 10
        return collectionFlowLayout
    }()
    
    
    
    
    
    @IBOutlet weak var itemCollectionView: UICollectionView!
    
    
    
    var projectItemTitle : [String] = ["At Thailand" , "Vlog January" , "Recorded Video", "Class Tutorial" , "A Night with Seiko" , "Louis Vuitton Store" , "Dubai Trip" , "Natural beauty","Egypt Blog video", "Last shortfilm project" , "Again Bali" , "February Blog" , "New Record" , "Tutorial class" ]
    var projectItemImage : [String] = ["thailand" , "vlog" , "record" , "class" , "seiko" , "loius" , "dubai" , "nature","pyramid","cinema"  , "thailand" , "vlog" , "record" , "class" ]
    var projectItemSize : [String] = ["1.2 GB" , "100 MB" , "5 GB", "3.6 MB" , "12.65 MB" , "500 MB" , "1 GB" , "2MB","2.7GB", "0.2MB","1.2 GB" , "100 MB" , "5 GB", "3.6 MB"]
    
    var isListView : Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemCollectionView.delegate = self
        itemCollectionView.dataSource = self
        itemCollectionView.register(UINib(nibName: "ItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ItemCollectionViewCell")
        itemCollectionView.register(UINib(nibName: "GridCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GridCollectionViewCell")
        //GridCollectionViewCell
        itemCollectionView.collectionViewLayout = listCVLayout
       // self.itemCollectionView.startInteractiveTransition(to: isListView ? self.listCVLayout : self.gridCVLayout, completion: nil)
       // self.itemCollectionView.finishInteractiveTransition()
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        
        //        let transitionManager: TransitionManager
        //        if layoutState == .list {
        //            layoutState = .grid
        //            transitionManager = TransitionManager(duration: 5, collectionView: itemCollectionView!, destinationLayout: gridLayout, layoutState: layoutState)
        //        } else {
        //            layoutState = .list
        //            transitionManager = TransitionManager(duration: 5, collectionView: itemCollectionView!, destinationLayout: listLayout, layoutState: layoutState)
        //        }
        //        transitionManager.startInteractiveTransition()
        //    }
        
        let newLayout = isListView ? gridCVLayout : listCVLayout ;
        isListView.toggle()
        itemCollectionView.reloadData()
        itemCollectionView.setCollectionViewLayout(newLayout, animated: true)
        
        
    }
}


extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource,UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if isListView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath) as! ItemCollectionViewCell
            cell.imageView.image = UIImage(named: projectItemImage[indexPath.row])
            cell.titleImage.text = projectItemTitle[indexPath.row]
            cell.sizeImage.text = projectItemSize[indexPath.row ]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCollectionViewCell", for: indexPath) as! GridCollectionViewCell
            cell.imageView.image = UIImage(named: projectItemImage[indexPath.row])
            cell.titleImage.text = projectItemTitle[indexPath.row]
            cell.sizeImage.text = projectItemSize[indexPath.row ]
            return cell
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // This method will be called when the collection view is scrolled
        // You can perform actions here when scrolling is detected
        print("Collection View is being scrolled")
    }
    
    

    
}

