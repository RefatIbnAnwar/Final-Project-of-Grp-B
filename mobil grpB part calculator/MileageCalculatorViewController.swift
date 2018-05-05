//
//  MileageCalculatorViewController.swift
//  mobil grpB part calculator
//
//  Created by Mobioapp on 7/20/17.
//  Copyright © 2017 Mobioapp. All rights reserved.
//

import UIKit

class MileageCalculatorViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var fuelPriceText: UITextField!
    @IBOutlet weak var fuelEfficiencyText: UITextField!
    @IBOutlet weak var setLocationViewOutlet: UIView!
    @IBOutlet weak var addressLabel: UILabel!
    
    // to show value in the subView
    @IBOutlet weak var fuelEfficiencyOutlet: UILabel!
    @IBOutlet weak var fuelPrice: UILabel!
    @IBOutlet weak var calculationView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.fuelPriceText.delegate = self
        self.fuelEfficiencyText.delegate = self
        
        
        //back bar
        self.navigationItem.title = "Mileage Calculator"
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController!.navigationBar.topItem!.backBarButtonItem = backButton
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
       
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    //MArk: Action
    @IBAction func unwindToSetLocation(sender: UIStoryboardSegue) {
        
        if let sourceViewController = sender.source as? SetLocationGoogleViewController {
            addressLabel.text = "Distance " + sourceViewController.addressInfo + " \(sourceViewController.distance) " + "Kilometres"
        }

    }
    
    
    
    
    @IBAction func calculationButtonTapped(_ sender: Any) {
        
        calculationView.isHidden = true
        fuelPrice.text = fuelPriceText.text
        fuelEfficiencyOutlet.text = fuelEfficiencyText.text
        
        
        guard !(fuelPriceText.text)!.isEmpty && !(fuelEfficiencyOutlet.text)!.isEmpty else {
            return
        }
        
//        guard !(fuelEfficiencyOutlet.text)!.isEmpty else {
//            return
//        }

        
        calculationView.isHidden = false

    }
    
    
}
