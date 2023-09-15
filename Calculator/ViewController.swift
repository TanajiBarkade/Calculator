//
//  ViewController.swift
//  Calculator
//
//  Created by apple on 30/07/23.
//

import UIKit

enum Opertaion : String{
    case Add = "+"
    case Subtrct = "-"
    case Multiply = "*"
    case Divide = "/"
    case NULL  = "null"
 
}




class ViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    
    var runningNumber = ""
    var LeftValue = ""
    var RightVlaue = ""
    var result = ""
    var currentopertion:Opertaion = .NULL
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        outputLabel.text = "0"
        
    }
    @IBAction func numberdPress(_ sender: RoundButton) {
        if runningNumber.count <= 9 {
        runningNumber += "\(sender.tag)"
        outputLabel.text = runningNumber
        }
    
    }
    @IBAction func allClearedPress(_ sender: RoundButton) {
        runningNumber = ""
        LeftValue = ""
        RightVlaue = ""
        result = ""
        currentopertion = .NULL
        outputLabel.text = "0"

    }
    
    @IBAction func dotPressed(_ sender: RoundButton) {
        
        if runningNumber.count <= 8 {
        runningNumber += "."
        outputLabel.text = runningNumber
        }
        
    }
    
    
    @IBAction func equalPressed(_ sender: RoundButton) {
        operation(operation: currentopertion)
    }
    
    @IBAction func addPresses(_ sender: RoundButton) {
        operation(operation: .Add)
    }
    
    @IBAction func subtractPressed(_ sender: RoundButton) {
        operation(operation: .Subtrct)
    }
    
    @IBAction func multiplicationPPressed(_ sender: RoundButton) {
        operation(operation: .Multiply)
    }
    
    @IBAction func divisionPressed(_ sender: RoundButton) {
        operation(operation: .Divide)
    }
    
    
    func operation(operation: Opertaion){
        if currentopertion != .NULL {
            if runningNumber != ""{
                RightVlaue = runningNumber
                runningNumber = ""
                if currentopertion == .Add{
                    result = "\(Double(LeftValue)! + Double(RightVlaue)!)"
                }else if currentopertion == .Subtrct{
                    result = "\(Double(LeftValue)! - Double(RightVlaue)!)"
                }else if currentopertion == .Multiply{
                    result = "\(Double(LeftValue)! * Double(RightVlaue)!)"
                    
                }else if currentopertion == .Divide{
                    result = "\(Double(LeftValue)! / Double(RightVlaue)!)"
                }
                
                LeftValue = result
                outputLabel.text = result
            }
            currentopertion = operation
            
        }else{
            LeftValue = runningNumber
            runningNumber = ""
            currentopertion = operation
        }
    }
    
}

