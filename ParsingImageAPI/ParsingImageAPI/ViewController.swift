//
//  ViewController.swift
//  ParsingImageAPI
//
//  Created by Xotech on 10/02/2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    let urlString = "https://app.kinggamesstudio.net/api/admin/cross-promotions/1"
    
    var bannerUIImage = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        performRequest()
        
        print(bannerUIImage.count)
    }
    
    
    func performRequest(){
        let url = URL(string: urlString)
        
        if let safeURL = url {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: safeURL) { data, response, error in
                if error != nil {
                    print(error)
                }
                if let safeData = data {
                    DispatchQueue.main.async {
                        self.parseJSONData(safeData)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSONData(_ safeData : Data ){
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(APIDecoder.self, from: safeData)
            
            DispatchQueue.main.async {
                for item in decodedData.CrossPromotions{
                    self.getImage(item.image_url)
                }
            }
            
            print(bannerUIImage.count," - okay ")
         
            
        } catch {
            print(error)
        }
    }
    
    
    
    func getImage(_ urlString : String){
        let url = URL(string: urlString)
        if let safeURL = url {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: safeURL) { data, response, error in
                if error != nil {
                    print(error)
                }
                
                if let safeData = data {
                    let img = UIImage(data: safeData)
                    if let image = img {
                        DispatchQueue.main.async{
                           self.bannerUIImage.append(image)
                            self.imageView.image = image
                           
                        }
                        
                    }
                }
            }
            task.resume()
        }
        print(urlString , bannerUIImage.count)
    }
    
    

}

