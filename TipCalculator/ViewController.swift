//
//  ViewController.swift
//  TipCalculator
//
//  Created by Daria Voblikova on 8/25/20.
//  Copyright © 2020 Daria Voblikova. All rights reserved.
//

import UIKit

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let basicFont = UIFont.systemFont(ofSize: 17)
        let darkTurquoise = UIColor(rgb: 0x007C9B)
        let normalAttribute: [NSAttributedString.Key: Any] = [.font: basicFont, .foregroundColor: darkTurquoise as Any]
        tipControl.setTitleTextAttributes(normalAttribute, for: .normal)
        tipLabel.textColor = darkTurquoise
        totalLabel.textColor = darkTurquoise
        billField.textColor = darkTurquoise
        
        let selectedFont = UIFont.boldSystemFont(ofSize: 17)
        let selectedAttribute: [NSAttributedString.Key: Any] = [.font: selectedFont, .foregroundColor: UIColor(rgb: 0xf93949)]
        tipControl.setTitleTextAttributes(selectedAttribute, for: .selected)
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func calculateTip(_ sender: Any) {
        // Get the bill amount
        let bill = Double(billField.text!) ?? 0
    
        let tipPercentages = [0.15, 0.18, 0.20]
        
        // Calculate the tip and total
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update the tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

