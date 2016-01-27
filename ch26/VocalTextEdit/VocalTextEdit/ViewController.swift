//
//  ViewController.swift
//  VocalTextEdit
//
//  Created by Donald Steinert on 1/26/16.
//  Copyright © 2016 Donald Steinert. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var textView: NSTextView!
    
    @IBAction func speakButtonClicked(sender: NSButton) {
        print("\(textView.string)")
    }

    @IBAction func stopButtonClicked(sender: NSButton) {
        print("The stop button was clicked")
    }

}

