//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Julien Shim on 4/23/22.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var numberOfPeople: String?
    var tipPercentage: String?
    var billPerPerson: String?

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        totalLabel.text = billPerPerson
        settingsLabel.text = "Split between \(numberOfPeople ?? "0") people, with \(tipPercentage ?? "0.0")% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
