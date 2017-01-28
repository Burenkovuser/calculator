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
    var firstOperand:Double = 0;
    var currentInput:Double {
        get {
            return Double(displayResultLabel.text!)!
        }
        set {
            displayResultLabel.text = "\(newValue)"
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
        
        firstOperand = currentInput
        print(firstOperand)
        stilTyping = false
        
    }
}

