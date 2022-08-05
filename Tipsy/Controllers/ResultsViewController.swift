//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Abduqodir's MacPro on 2021/09/29.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var label: String?
    var numOfPeople: Int?
    var tipPct: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = label
        settingsLabel.text = "Split between \(numOfPeople ?? 0) people, with \(tipPct!) tip."

        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    

}
