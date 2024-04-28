//
//  ViewController.swift
//  ListGridTransitionPod
//
//  Created by Xotech on 04/04/2024.
//

import UIKit
import DisplaySwitcher

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private lazy var listLayout =  UICollectionViewFlowLayout()
    private lazy var gridLayout =  UICollectionViewFlowLayout()

    let imageFile = ["cinema", "class", "dubai", "loius", "nature", "pyramid", "record", "seiko", "thailand", "vlog"]
    let imageTitle = ["Cinematic Hub", "Classy Educational ", "Dynamic Urban", "Luxury Oasis  Space", "Nurturing Natural ", "Pyramid of Ancient Wonders", "Record-Breaking Achievement", "Seiko Timekeeping ", "Thriving Cultural ", "Vibrant Online "]

    @IBOutlet weak var ProjectView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        projectItemCollectionManager()
        
    }
    
    func projectItemCollectionManager() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = listLayout
        collectionView.showsVerticalScrollIndicator = false
     
        collectionView.register(UINib(nibName: "listCell", bundle: nil), forCellWithReuseIdentifier: "listCell")
        collectionView.register(UINib(nibName: "gridCell", bundle: nil), forCellWithReuseIdentifier: "gridCell")
        
        
        DispatchQueue.main.async {
            let w = self.ProjectView.layer.frame.width
            let h = self.ProjectView.layer.frame.height
            
            print(w,h)
            self.listLayout.itemSize = CGSize(width: w-32, height: 88*h/759 )
            
            let gridItemWidth = 183*w/414
            let gridItemHeight = 212*h/759
          
            self.gridLayout.itemSize = CGSize(width: gridItemWidth, height: gridItemHeight )
           
        }
       
        layoutBasicStruture(listLayout, true, 16)
        layoutBasicStruture(gridLayout, true, 16)
     
        
        
    }
    func layoutBasicStruture(_ layout : UICollectionViewFlowLayout ,_ scrollDir : Bool , _ space  : CGFloat ){
        layout.scrollDirection = scrollDir ? .vertical : .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = space
        layout.minimumInteritemSpacing = 0
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        collectionView.startInteractiveTransition(to: gridLayout) { [weak self] _,_  in
                    
            print(" made Action ")
            self?.collectionView.collectionViewLayout.invalidateLayout()
        }
    }
    
}


extension ViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageFile.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "listCell", for: indexPath ) as! listCell
        cell.imageview.image = UIImage(named: imageFile[indexPath.row])
        cell.label.text = imageTitle[indexPath.row]
        return cell
    }

    
}

