//
//  ViewController.swift
//  Calculator
//
//  Created by Karol Zmyslowski on 16.12.2017.
//  Copyright © 2017 Karol Zmyslowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var userIsInTheMiddleOfTyping = false
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    @IBOutlet weak var display: UILabel!

    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTyping = true
        }
    }
    @IBAction func performOperation(_ sender: UIButton) {
        userIsInTheMiddleOfTyping = false
        if let mathematicalSymbol = sender.currentTitle {
            switch mathematicalSymbol {
            case "𝛑":
                displayValue = Double.pi
            case "√":
                displayValue = sqrt(displayValue)
            default:
                break
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

