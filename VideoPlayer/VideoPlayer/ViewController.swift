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
    
    var player: AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print ( " get Video Player ")
      
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //self.getVideoPlayerController()
        print("")
        print ( " Start Timer -> ")
        self.downloadVideoNDisplay()
        
    }
    
    
    private func  downloadVideoNDisplay(){
        let playerLayer = AVPlayerLayer()
        playerLayer.frame = view.bounds
        //playerLayer.videoGravity = .re
        view.layer.addSublayer(playerLayer)
        self.downloadAndPlayVideo(from: "https://app.kinggamesstudio.net/storage/YUNRr8nDfZfDcur0vJmNxF4C51TLp7IjWSjvzIwgpzx4RXMBoR.mp4", playerLayer: playerLayer)
    }
    
    private func downloadAndPlayVideo(from url: String, playerLayer: AVPlayerLayer) {
        
        guard let videoURL = URL(string: url) else { return }
        
        let urlSession = URLSession(configuration: .default)
        
        let downloadTask = urlSession.downloadTask(with: videoURL) { [weak self] (location, response, error) in
            
            guard let self = self else { return }
            print(location)
            
            if let location = location {
                do {
                    
                    let documentsURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                    let destinationURL = documentsURL.appendingPathComponent(videoURL.lastPathComponent)
                    
                    try FileManager.default.moveItem(at: location, to: destinationURL)
                    
                    DispatchQueue.main.async {
                        let asset = AVAsset(url: destinationURL)
                        let playerItem = AVPlayerItem(asset: asset)
                        self.player = AVPlayer(playerItem: playerItem)
                        playerLayer.player = self.player
                        self.player?.play()
                    }
                } catch {
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
        
        downloadTask.resume()
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

