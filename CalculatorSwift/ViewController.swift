//
//  ViewController.swift
//  CalculatorSwift
//
//  Created by Vasilii on 28.01.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayResultLabel: UILabel!
    var stilTyping = false//будет вводится новое число
    var dotIsPlace = false//в числе нет точки
    var firstOperand:Double = 0
    var secondOperand: Double = 0
    var opirationSign:String = ""
    
    var currentInput:Double {
        get {
            return Double(displayResultLabel.text!)!
        }
        set {
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            if valueArray[1] == "0" {
                displayResultLabel.text = "\(valueArray[0])"
            } else {
                displayResultLabel.text = "\(newValue)"
            }
            stilTyping = false
        }
    }

    @IBAction func numberPressed(_ sender: UIButton) {
        
        let number = sender.currentTitle! //задаем кнопка  это цифры с заголовка
        
        if stilTyping {
            if (displayResultLabel.text?.characters.count)! < 20 {//если символов меньше 20
                
                displayResultLabel.text = displayResultLabel.text! + number //выводим данные с кнопок на лайбл
        }
        
        } else {
            displayResultLabel.text = number
            stilTyping = true
        }
       
    }

    @IBAction func twoOperandsSingPressed(_ sender: UIButton) {
        
        opirationSign = sender.currentTitle!
        firstOperand = currentInput
        stilTyping = false
        dotIsPlace = false //у следующего числа можно поставить точку
    }
    
    func opirateWithTwoOperands(operation: (Double, Double) -> Double) {
        currentInput = operation(firstOperand, secondOperand)
        stilTyping = false // после знака равно не добавлять новые цифры
    }
    
    @IBAction func equalitySiggPressed(_ sender: UIButton) {
        
        if stilTyping {
            secondOperand = currentInput
        }
        
        dotIsPlace = false
        
        switch opirationSign {
        case "+":
            opirateWithTwoOperands{$0 + $1}
        case "-":
            opirateWithTwoOperands{$0 - $1}
        case "×":
            opirateWithTwoOperands{$0 * $1}
        case "÷":
            opirateWithTwoOperands{$0 / $1}
        default:
            break
        }
    }
   
    @IBAction func clearButtonPress(_ sender: UIButton) {
        firstOperand = 0
        secondOperand = 0
        currentInput = 0
        displayResultLabel.text = "0"
        stilTyping = false
        dotIsPlace = false
        opirationSign = ""
    }
    
    @IBAction func plusMinusButtonPressed(_ sender: UIButton) {
        currentInput = -currentInput
    }
    
    @IBAction func persentafeButtonPresed(_ sender: UIButton) {
        if firstOperand == 0 {
            currentInput = currentInput / 100
        } else {
            secondOperand = firstOperand * currentInput / 100
        }
        stilTyping = false
    }
    
    @IBAction func squareRootPressed(_ sender: UIButton) {
        currentInput = sqrt(currentInput)
    }
    
    @IBAction func dotButtonPressed(_ sender: UIButton) {
        if stilTyping && !dotIsPlace {
            displayResultLabel.text = displayResultLabel.text! + "."
           dotIsPlace = true
        }else if !stilTyping && !dotIsPlace {
            displayResultLabel.text = "0."
        }
    }
}

