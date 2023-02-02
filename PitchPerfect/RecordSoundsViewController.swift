//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Sol on 1/31/23.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate  {
    var audioRecorder: AVAudioRecorder!
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
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
               let recordingName = "recordedVoice.wav"
               let pathArray = [dirPath, recordingName]
               let filePath = URL(string: pathArray.joined(separator: "/"))
               
               let audioSession = AVAudioSession.sharedInstance()
               try! audioSession.setCategory(.playAndRecord, mode: .spokenAudio, options: .defaultToSpeaker)
               
               try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
               audioRecorder.delegate = self
               audioRecorder.isMeteringEnabled = true
               audioRecorder.prepareToRecord()
               audioRecorder.record()

    }
    
    
    @IBAction func stopRedroding(_ sender: UIButton) {
        setPlayButtonsEnabled(true)
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        } else {
            print("recording was not succesful")
            
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "stopRecording" {
//            let playSoundViewController = segue.destination as! PlaySoundsViewController
//            let recordedSoundURL = sender as! URL
//            playSoundViewController.recordedAudioURL = recordedSoundURL
//        }
//    }
    
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

