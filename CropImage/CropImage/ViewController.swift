//
//  ViewController.swift
//  CropImage
//
//  Created by Xotech on 30/01/2024.
//

import UIKit
import PhotosUI
import CropViewController

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var croppedImage : UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewWillAppear")
       // createButton()
        if let cI = croppedImage {
            imageView.image = cI
        }
    
    }
    
    func createButton(){
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        view.addSubview(button)
        button.setTitle("Pick Photo", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 15
        //button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        // didTapButton = pickImageTapped
    }
    
    @IBAction func pickImageTapped(_ sender: UIButton) {
    
        print("Tapped")
        var config = PHPickerConfiguration()
        config.selectionLimit = 1
        
        let picker = PHPickerViewController(configuration: config)
        
        picker.delegate = self
        
        self.present(picker, animated: true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Perform actions before the view appears, such as reloading data
        print("viewWillAppear")
    }
    
    func cropImage(_ image : UIImage){
        //print(image)
        var cropView = CropViewController(croppingStyle: .default, image: image )
        cropView.aspectRatioPreset = .presetSquare
        cropView.aspectRatioLockEnabled = false
        cropView.doneButtonTitle = "Done"
        cropView.delegate = self
        present(cropView,animated: true )
    }


}

extension ViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true )
        
        for result in results {
            result.itemProvider.loadObject(ofClass: UIImage.self, completionHandler: { [self]object,error in
                if let image = object as? UIImage {
                    DispatchQueue.main.async { [self] in
                        self.cropImage(image)
                    }
                }
            })
        }
    }
}


extension ViewController : CropViewControllerDelegate {
    
    func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
        print("didCropToImage")
        print(image)
        imageView.image = image
        cropViewController.dismiss(animated: true)
    }
}


