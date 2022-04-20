//
//  ViewController.swift
//  Tipsy
//
//  Created by Julien Shim on 4/23/22.
//

import UIKit

class CalculatorViewController: UIViewController {

    var selectedTip: Double = 0.1
    var selectedSplit: Double = 2.0
    var billPerPersonString = "0.0"
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        let selectedButtonTitle = sender.currentTitle
        zeroPercentButton.isSelected = selectedButtonTitle == "0%"
        tenPercentButton.isSelected = selectedButtonTitle == "10%"
        twentyPercentButton.isSelected = selectedButtonTitle == "20%"
        
        if zeroPercentButton.isSelected {
            selectedTip = 0.0
        } else if tenPercentButton.isSelected {
            selectedTip = 0.1
        } else if twentyPercentButton.isSelected {
            selectedTip = 0.2
        }
        
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        selectedSplit = sender.value
        splitNumberLabel.text = String(format: "%.0f", selectedSplit)
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        let billTotal = Double(billTextField.text ?? "0.0") ?? 0.0
        let billPerPerson = billTotal * (1.0 + selectedTip) / selectedSplit
        billPerPersonString = String(format: "%.2f", billPerPerson)
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.numberOfPeople = String(format: "%.0f", selectedSplit)
            destinationVC.tipPercentage = String(format: "%.0f", selectedTip * 100)
            destinationVC.billPerPerson = billPerPersonString
        }
    }
}

