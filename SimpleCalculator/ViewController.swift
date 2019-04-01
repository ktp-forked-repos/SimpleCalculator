//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Shivam on 01/04/19.
//  Copyright © 2019 Shivam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var isFirstDigit = true
    var operation1 : Double = 0
    var operation2 = "="
    var displayValue : Double {
        get {
            
            return NumberFormatter().number(from: label.text!)!.doubleValue
        }
        set {
            label.text = String(format: "%4.0f", newValue)
            isFirstDigit = true
            operation2 = "="
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func digitPressed(_ sender: AnyObject) {
        
        let digit = sender.currentTitle!
        
        label.text = isFirstDigit ? digit : label.text! + digit!
        isFirstDigit = false
        
        
        
        
    }
    
    @IBAction func cancel(_ sender: Any) {
        
        displayValue = 0
        
    }
    

    @IBAction func operation(_ sender: AnyObject) {
        
        operation2 = sender.currentTitle!
        operation1 = displayValue
        isFirstDigit = true
        
        
        
        
    }
    @IBAction func calculation(_ sender: Any) {
        
        switch operation2 {
        
        case "+":
            displayValue += operation1
        
        case "-":
            displayValue = operation1 - displayValue
            
        case "*":
            displayValue *= operation1
            
        case "/":
            displayValue = operation1 / displayValue
            
        default:
            break
        }
        
    }
    
}

