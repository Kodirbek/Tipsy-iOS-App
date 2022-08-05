//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var tipAmount: Double = 0.1
    var tipPercentage = "10%"
    var numberOfPeople: Int = 2
    var calculatedAmount: Double?

    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        if sender == zeroPctButton {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tipAmount = 0.0
            tipPercentage = "0%"
        } else if sender == tenPctButton {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            tipAmount = 0.1
            tipPercentage = "10%"
        } else {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            tipAmount = 0.2
            tipPercentage = "20%"
        }
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numberOfPeople = Int(sender.value)
        splitNumberLabel.text = String(numberOfPeople)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let billTotal = Double(billTextField.text!) ?? 0.0
        
        if tipAmount == 0.0 {
            calculatedAmount = billTotal / Double(numberOfPeople)
        } else {
            calculatedAmount = (billTotal + (billTotal * tipAmount)) / Double(numberOfPeople)
        }
        
        performSegue(withIdentifier: "GoToSegue", sender: self)
        
     }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultsViewController
        destinationVC.label = String(format: "%.2f", calculatedAmount!)
        destinationVC.numOfPeople = numberOfPeople
        destinationVC.tipPct = tipPercentage
    }
    
    
    
    
    

}

