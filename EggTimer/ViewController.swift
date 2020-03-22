//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
//    let softTime = 5
//    let mediumTime = 7
//    let hardTime  = 12
   var player: AVAudioPlayer!
    @IBOutlet weak var ProgressBar: UIProgressView!
    let EggTimeType = ["Soft": 1, "Medium": 4, "Hard" : 12]
    var secondRemaining  = 60
    var timer = Timer()
    var  totalSecond = 0
    @IBOutlet weak var ImageLable: UILabel!
    @IBAction func EggButtonPressed(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
     
        ProgressBar.progress =  0.0
        ImageLable.text = hardness
        print( sender.currentTitle!)
        secondRemaining = EggTimeType[hardness]!*60
        totalSecond =  secondRemaining
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    @objc func updateTime() {
            
           if(secondRemaining > 0) {
                print ( "\(secondRemaining) second")
                ImageLable.text = " \(secondRemaining)"
                ProgressBar.progress = 1.0 - Float( secondRemaining)/Float(totalSecond)
                secondRemaining -= 1
                }
           else
                {
                timer.invalidate()
                playSound(soundName: "alarm_sound")
                ImageLable.text = "Done"
                    
                }
        
        }
    func playSound(soundName: String) {
           let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
           player = try! AVAudioPlayer(contentsOf: url!)
           player.play()
                   
       }
    

}

