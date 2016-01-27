//
//  ViewController.swift
//  VocalTextEdit
//
//  Created by Donald Steinert on 1/26/16.
//  Copyright © 2016 Donald Steinert. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    let speechSynthesizer = NSSpeechSynthesizer()
    let synthesizerDelegate = NSSpeechSynthesizerDelegate.self
    
    
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
    
    @IBAction func speakButtonClicked(sender: NSButton) {
        
        if speechSynthesizer.speaking {
            return
        } else {
            btnSpeak.enabled = false
            btnStop.enabled = true
            NSSpeechSynthesizerDelegate(speechSynthesizer, didChange(<#T##changeKind: NSKeyValueChange##NSKeyValueChange#>, valuesAtIndexes: <#T##NSIndexSet#>, forKey: <#T##String#>)
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
    
}

