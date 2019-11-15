//
//  ViewController.swift
//  Calculator
//
//  Created by Samuel Arogundade on 2019-10-30.
//  Copyright © 2019 Samuel Arogundade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var operationSet: UILabel!
    
    var numOnScreen: Double = 0
    var previousNum : Double = 0
    var operation = 0
    var performingOperation = false
    var firstTime : Bool = true
    var operand: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultLabel.text = "0"
    }


    @IBAction func numberPressed(_ sender: Any) {
        let tag = (sender as! UIButton).tag
        
        if performingOperation == true{
            performingOperation = false
            resultLabel.text = String(tag)
            numOnScreen = Double(resultLabel.text!)!
        }
        else{
            if firstTime == true{
                resultLabel.text! = String(tag)
                firstTime = false
                numOnScreen = Double(resultLabel.text!)!
            }
            else{
                resultLabel.text! += String(tag)
                numOnScreen = Double(resultLabel.text!)!
            }
            
        }
        
        
        
    }
    
    func setText() -> String{
        
        
        var prev: String = ""
        var screen: String = ""
        
        if previousNum == floor(previousNum){
            prev = String(Int(previousNum))
        }
        else{
            prev = String(previousNum)
        }
        
        if numOnScreen == floor(numOnScreen){
            screen = String(Int(numOnScreen))
        }
        else{
            screen = String(numOnScreen)
        }
        
        return prev + " " + operand + " " + screen
    }
    
    
    @IBAction func operatorPressed(_ sender: Any) {
        let tag = (sender as! UIButton).tag
        if (tag == 15){
            resultLabel.text = "0"
            firstTime = true
            previousNum = 0
            numOnScreen = 0
            operation = 0
            operationSet.text = ""
            
            return
        }
        
        if tag == 10{
            performingOperation = true
            previousNum = Double (resultLabel.text!)!
            resultLabel.text! += " / "
            operation = tag
            
        }
        else if tag == 11{
            performingOperation = true
            previousNum = Double (resultLabel.text!)!
            resultLabel.text! += " * "
            operation = tag
        }
        else if tag == 12{
            performingOperation = true
            previousNum = Double (resultLabel.text!)!
            resultLabel.text! += " - "
            operation = tag
        }
        else if tag == 13{
            performingOperation = true
            previousNum = Double (resultLabel.text!)!
            resultLabel.text! += " + "
            operation = tag
        }
        else if tag == 14{
            var holdDouble : Double = 0
            firstTime = true
            
            if operation == 10{
                operand = "/"
                operationSet.text = setText()
                holdDouble = previousNum / numOnScreen
                if floor(holdDouble) == holdDouble{
                    resultLabel.text = String(Int(holdDouble))
                }else{
                    resultLabel.text = String(holdDouble)
                }
                
                
                
            }
            else if operation == 11{
                operand = "*"
                operationSet.text = setText()
                holdDouble = previousNum * numOnScreen
                if floor(holdDouble) == holdDouble{
                    resultLabel.text = String(Int(holdDouble))
                }else{
                    resultLabel.text = String(holdDouble)
                }
            }
            else if operation == 12{
                operand = "-"
                operationSet.text = setText()
                holdDouble = previousNum - numOnScreen
                if floor(holdDouble) == holdDouble{
                    resultLabel.text = String(Int(holdDouble))
                }else{
                    resultLabel.text = String(holdDouble)
                }
            }
            else if operation == 13{
                operand = "+"
                operationSet.text = setText()
                holdDouble = previousNum + numOnScreen
                if floor(holdDouble) == holdDouble{
                    resultLabel.text = String(Int(holdDouble))
                }else{
                    resultLabel.text = String(holdDouble)
                }
            }
        }
    }
}

