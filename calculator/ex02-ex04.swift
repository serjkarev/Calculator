//
//  ViewController.swift
//  calculator
//
//  Created by Serhii KAREV on 4/1/19.
//  Copyright © 2019 Serhii KAREV. All rights reserved.
//

import UIKit

class ex02: UIViewController {

    @IBOutlet weak var displayResultLabel: UILabel!
    var stillTyping = false
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var operationSign: String = ""
    
    var currenInput: Double {
        get {
            return Double(displayResultLabel.text!)!
        }
        set {
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            if valueArray.count > 1 && valueArray[1] == "0" {
                displayResultLabel.text = "\(valueArray[0])"
            }
            else {
                displayResultLabel.text = "\(newValue)"
            }
            stillTyping = false
        }
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        let number = sender.currentTitle!
        
        if stillTyping {
            if displayResultLabel.text!.characters.count < 20 {
                displayResultLabel.text = displayResultLabel.text! + number
            }
        } else {
            displayResultLabel.text = number
            stillTyping = true
        }
    }
    
    @IBAction func twoOperandsSignPressed(_ sender: UIButton) {
        operationSign = sender.currentTitle!
        firstOperand = currenInput
        stillTyping = false
    }
    
    func operationWithTwoOperands(operation: (Double, Double) -> Double) {
        currenInput = operation(firstOperand, secondOperand)
        stillTyping = false
    }
    
    @IBAction func equalitySignPressed(_ sender: UIButton) {
        
        if stillTyping {
            secondOperand = currenInput
        }
        switch operationSign {
        case "+":
            operationWithTwoOperands{$0 + $1}
        case "-":
            operationWithTwoOperands{$0 - $1}
        case "×":
            operationWithTwoOperands{$0 * $1}
        case "÷":
            operationWithTwoOperands{$0 / $1}
        default: break
        }
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        firstOperand = 0
        secondOperand = 0
        currenInput = 0
        displayResultLabel.text = "0"
        stillTyping = false
        operationSign = ""
    }
    
    @IBAction func plusMinusButtonPressed(_ sender: UIButton) {
        if currenInput != 0 {
            currenInput = -currenInput
        }
    }
}

