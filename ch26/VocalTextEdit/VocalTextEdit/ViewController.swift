//
//  ViewController.swift
//  VocalTextEdit
//
//  Created by Donald Steinert on 1/26/16.
//  Copyright © 2016 Donald Steinert. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSSpeechSynthesizerDelegate {

    let speechSynthesizer = NSSpeechSynthesizer()
    
    @IBOutlet var textView: NSTextView!
    
    @IBOutlet weak var btnSpeak: NSButton!
    @IBOutlet weak var btnStop: NSButton!
    
    var contents: String? {
        get {
            return textView.string
        } set {
            textView.string = newValue
        }
    }
    
    override func viewDidLoad() {
        self.speechSynthesizer.delegate = self
    }
    
    @IBAction func speakButtonClicked(sender: NSButton) {
        
        if speechSynthesizer.speaking {
            return
        } else {
            btnSpeak.enabled = false
            btnStop.enabled = true
            if let contents = textView.string where !contents.isEmpty {
                speechSynthesizer.startSpeakingString(contents)
            } else {
                speechSynthesizer.startSpeakingString("The document is empty")
            }
        }
        
    }

    @IBAction func stopButtonClicked(sender: NSButton) {
        if speechSynthesizer.speaking {
            speechSynthesizer.stopSpeaking()
        }
    }
    
    func speechSynthesizer(sender: NSSpeechSynthesizer, didFinishSpeaking finishedSpeaking: Bool) {
        btnSpeak.enabled = true
        btnStop.enabled = false
    }
    
}

