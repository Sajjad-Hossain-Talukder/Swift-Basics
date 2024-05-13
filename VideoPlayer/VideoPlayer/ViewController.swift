//
//  ViewController.swift
//  VideoPlayer
//
//  Created by Xotech on 13/05/2024.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print ( " get Video Player ")
      
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.getVideoPlayerController()
    }
    
    private func getVideoPlayer(){
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "test", ofType: "mp4")!))
        let layer = AVPlayerLayer(player: player)
        layer.frame = view.bounds
        view.layer.addSublayer(layer)
        //layer.videoGravity = .resizeAspectFill
        //player.volume = 0
        player.play()
    }
    
    
    private func getVideoPlayerController(){
        
        let vc = AVPlayerViewController()
        vc.player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "test", ofType: "mp4")!))
        present(vc, animated: true)
    }
    
    

}

