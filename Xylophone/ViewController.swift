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

    // The question mark means that
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // Interface Builder Actions (IB Actions):
    @IBAction func keyPressed(_ sender: UIButton) {
        // NSLog("I got pressed");
        // print("I got pressed")
        playSound(fileName: "C")
    }
    
    @IBAction func keyPressedD(_ sender: UIButton) {
        playSound(fileName: "D")
    }
    
    @IBAction func keyPressedE(_ sender: UIButton) {
        playSound(fileName: "E")
    }
    
    @IBAction func keyPressedGeneral(_ sender: UIButton) {
        // print(sender.titleLabel?.text)
        playSound(fileName: sender.currentTitle!)
    }
    
    
    
    
    
    
    
    func playSound(fileName: String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    

}

