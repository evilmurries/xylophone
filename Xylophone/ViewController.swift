//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func keyPressed(_ sender: UIButton) {
        
        guard let key = sender.currentTitle else { return }
        
        playSound(key)
    }
    
    func playSound(_ key: String) {
        
        guard let url: URL = Bundle.main.url(forResource: key, withExtension: "wav") else { return }
        
        do {
            
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            player?.play()
            
        } catch let error {
            print(error)
        }
    }
}

