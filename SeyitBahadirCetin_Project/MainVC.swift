//
//  ViewController.swift
//  SeyitBahadirCetin_Project
//
//  Created by CTIS Student on 23.05.2021.
//  Copyright © 2021 CTIS. All rights reserved.
//

import UIKit
import AVFoundation
class MainVC: UIViewController {

    @IBOutlet weak var soundBtn: UIButton!
    var player: AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnAction(_ sender: UIButton) {
        if let player = player, player.isPlaying{
            // stop playback
            
            soundBtn.setImage(UIImage(systemName: "speaker.slash.fill"), for: .normal)
            player.stop()
        }
        else{
            
            soundBtn.setImage(UIImage(systemName: "speaker.3.fill"), for: .normal)
            let urlString = Bundle.main.path(forResource: "bgMusic", ofType: "mp3")
            do{
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                guard let urlString = urlString else {
                    return
                }
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                
                guard let player = player else {
                    return
                }
                
                player.play()
            }
            catch {
                print("something went wrong")
            }
        }
    }
    
    
}

