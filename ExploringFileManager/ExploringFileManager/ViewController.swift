//
//  ViewController.swift
//  ExploringFileManager
//
//  Created by Xotech on 16/05/2024.
//

import UIKit

class ViewController: UIViewController {
    
    let manager = FileManager.default

    override func viewDidLoad() {
        super.viewDidLoad()
       
        guard let url = manager.urls(for: .documentDirectory , in: .userDomainMask ).first else {
            return
        }
        
        
        print ( " Document Directory URL : \(url) ")
        
        self.createASubdirectoryInside_Test_Folder(url: url)
        
        
        //self.remove_the_File(url: url)
       
    }
    
    
    func createASubdirectoryInside_Test_Folder( url : URL ){
        
        let newFolderURL = url.appendingPathComponent("Test1/SubFolder")
        
        try? manager.createDirectory(
            at: newFolderURL,
            withIntermediateDirectories: true,
            attributes: [:])
        
        
        self.create_A_txt_File_inside_The_SubFolder(url: url)
    }
    
    func  create_A_txt_File_inside_The_SubFolder(url : URL){
        
        let newFileURL = url.appendingPathComponent("Test1/SubFolder/logs.txt")
        
        let dataString = " Hello World "
        
        let data = dataString.data(using: .utf16 )
        
        manager.createFile(
            atPath: newFileURL.path ,
            contents: data,
            attributes: [FileAttributeKey.creationDate: Date() ])
    
    }
    
    func remove_the_File(url:URL){
        let newFileURL = url.appendingPathComponent("Test/SubFolder/logs.txt")
        
        if manager.fileExists(atPath: newFileURL.path ){
           
            do {
                try manager.removeItem(at: newFileURL)
            } catch{
                print (error)
            }
           
        }
        
    }


}

