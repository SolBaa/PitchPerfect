//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Sol on 1/31/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var recordButton: UIButton!
    @IBOutlet var stopRecordingButton: UIButton!
    @IBOutlet var recordLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setPlayButtonsEnabled(true)
    }

    @IBAction func recordAudio(_ sender: UIButton) {
        setPlayButtonsEnabled(false)

    }
    
    
    @IBAction func stopRedroding(_ sender: UIButton) {
        setPlayButtonsEnabled(true)
    }
    
    func setPlayButtonsEnabled(_ enabled: Bool) {
        stopRecordingButton.isEnabled = !enabled
        recordButton.isEnabled = enabled
        if enabled {
            recordLabel.text = "Tap to Record"
        } else {
            recordLabel.text = "Recording in progress"
        }
        
    }
}

