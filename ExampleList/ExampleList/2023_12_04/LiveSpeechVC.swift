//
//  LiveSpeachVC.swift
//  ExampleList
//
//  Created by 노주영 on 2023/12/04.
//

import UIKit
import Speech

class LiveSpeechVC: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    //스피치 할때 4개 필수
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "ko-KR"))
    private let audioEngine = AVAudioEngine()
    
    private var speechRecognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var speachRecognitionTask: SFSpeechRecognitionTask?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.authorizeSR()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension LiveSpeechVC {
    @IBAction func clickStart(_ sender: UIButton) {
        self.startButton.isEnabled = false
        self.finishButton.isEnabled = true
        
        do {
            try startSession()
        } catch {
            print("안됨")
        }
    }
    
    func startSession() throws {
        if let task = speachRecognitionTask {
            task.cancel()
            self.speachRecognitionTask = nil
        }
        
        let audioSession = AVAudioSession.sharedInstance()
        try audioSession.setCategory(.record, mode: .default)
        
        speechRecognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        
        guard let recognitionRequest = speechRecognitionRequest else { return }
        
        let inputNode = audioEngine.inputNode
        recognitionRequest.shouldReportPartialResults = true
        
        speechRecognizer?.recognitionTask(with: recognitionRequest) { result, error in
            var isFinished = false
            
            if let result = result {
                self.textView.text = result.bestTranscription.formattedString
                isFinished = result.isFinal
            }
            
            if error != nil || isFinished {
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)
                
                self.speechRecognitionRequest = nil
                self.speachRecognitionTask = nil
                self.startButton.isEnabled = true
                self.finishButton.isEnabled = false
            }
        }
        
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
            self.speechRecognitionRequest?.append(buffer)
        }
        
        audioEngine.prepare()
        try audioEngine.start()
    }
    
    @IBAction func clickFinish(_ sender: UIButton) {
        if audioEngine.isRunning {
            audioEngine.stop()
            speechRecognitionRequest?.endAudio()
            
            self.startButton.isEnabled = true
            self.finishButton.isEnabled = false
        }
    }
}

extension LiveSpeechVC {
    func authorizeSR() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            switch authStatus {
            case .authorized:
                self.startButton.isEnabled = true

            case .denied:
                self.startButton.isEnabled = false
                self.startButton.setTitle("Speech recognition access denied by user", for: .disabled)

            case .restricted:
                self.startButton.isEnabled = false
                self.startButton.setTitle(
                    "Speech recognition restricted on device", for: .disabled)

            case .notDetermined:
                self.startButton.isEnabled = false
                self.startButton.setTitle(
                    "Speech recognition not authorized", for: .disabled)
            default: break
            }
        }
    }
}
