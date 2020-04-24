//
//  SoundViewController.swift
//  ChilLax
//
//  Created by Kelvin Cheng on 4/22/20.
//  Copyright © 2020 Kelvin Cheng. All rights reserved.
//

import UIKit
import AVFoundation

class SoundViewController: UIViewController {
    
    @IBOutlet weak var soundNameLabel: UILabel!
    @IBOutlet weak var placeDescriptionLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    
    var soundInfo: SoundInfo!
    var soundfileName: String = ""
    var soundBackgroundImage: String = ""
    
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "\(soundInfo.backgroundImage)")!).withAlphaComponent(0.5)
        backgroundView.backgroundColor = UIColor.clear
        updateUserInterface()
        playSound(soundName: "\(soundInfo.fileName)", audioPlayer: &audioPlayer)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        audioPlayer.stop()
    }
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        if let sound = NSDataAsset(name: soundName)
        {
            do
            {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
                Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateAudioProgressView), userInfo: nil, repeats: true)
                progressView.setProgress(Float(audioPlayer.currentTime / audioPlayer.duration), animated: false)
            }
            catch
            {
                print("ERROR: data in \(soundName) couldn't be played as a sound.")
            }
        }
        else
        {
            print("ERROR: Could not read data from sound file.")
        }
    }
    
    @IBAction func playButtonPressed(_ sender: Any) {
        if !audioPlayer.isPlaying {
            audioPlayer.play()
        }
    }
    
    @IBAction func pauseButtonPressed(_ sender: Any) {
        audioPlayer.pause()
    }
    
    @objc func updateAudioProgressView() {
       if audioPlayer.isPlaying {
           progressView.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: true)
          }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        var time: TimeInterval = audioPlayer.currentTime
        time -= 15.0
          if time > audioPlayer.duration {
            audioPlayer.stop()
          } else {
             audioPlayer.currentTime = time
          }
        
    }
    
    @IBAction func forwardButtonPressed(_ sender: Any) {
        var time: TimeInterval = audioPlayer.currentTime
        time += 15.0
          if time > audioPlayer.duration {
            audioPlayer.stop()
          } else {
             audioPlayer.currentTime = time
          }
    }
    
    func updateUserInterface() {
        soundNameLabel.text = soundInfo.name
        soundfileName = soundInfo.fileName
        placeDescriptionLabel.text = soundInfo.placeDescription
        soundBackgroundImage = soundInfo.backgroundImage
    }
}
