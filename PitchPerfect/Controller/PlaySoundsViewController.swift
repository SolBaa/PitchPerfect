//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Sol on 2/1/23.
//


import UIKit
import AVFoundation


class PlaySoundsViewController: UIViewController {
    

    @IBOutlet var echoButton: UIButton!
    @IBOutlet var reberButton: UIButton!
    @IBOutlet var vaderButton: UIButton!
    @IBOutlet var squirrelButton: UIButton!
    @IBOutlet var snailButton: UIButton!
    @IBOutlet var rabbitButton: UIButton!
    
    @IBOutlet var stopButton: UIButton!
    
    var recordedAudioURL: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, highPitch, lowPitch, echo, reverb
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureUI(.notPlaying)
    }
    
    @IBAction func playSoundButton(_ sender: UIButton) {
        print("Play Sound Button Pressed")
        switch(ButtonType(rawValue: sender.tag)!) {
                case .slow:
                    playSound(rate: 0.5)
                case .fast:
                    playSound(rate: 1.5)
                case .highPitch:
                    playSound(pitch: 1000)
                case .lowPitch:
                    playSound(pitch: -1000)
                case .echo:
                    playSound(echo: true)
                case .reverb:
                    playSound(reverb: true)
                }
                
                configureUI(.playing)
    }
    
    
    @IBAction func stopButtonPressed(_ sender: UIButton) {
        print("Stop Audio Button Pressed")
        stopAudio()
    }
}
