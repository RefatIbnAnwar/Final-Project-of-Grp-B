//
//  CarRoadTaxCalculatorViewController.swift
//  mobil grpB part calculator
//
//  Created by Mobioapp on 7/18/17.
//  Copyright © 2017 Mobioapp. All rights reserved.
//

import UIKit

class CarRoadTaxCalculatorViewController: UIViewController, UIWebViewDelegate {

    
    @IBOutlet weak var carRoadActivityIndicatorOutlet: UIActivityIndicatorView!
    
    @IBOutlet weak var carRoadTaxCalculatorWebView: UIWebView!
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //carRoadActivityIndicatorOutlet.hidesWhenStopped = true
        
        carRoadTaxCalculatorWebView.delegate = self
        
        let url = NSURL(string: "https://www.google.com")
        
        carRoadTaxCalculatorWebView.loadRequest(NSURLRequest(url: url! as URL) as URLRequest)
        
        
        //back bar
        self.navigationItem.title = "Car Road Tax Calculator"
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController!.navigationBar.topItem!.backBarButtonItem = backButton
        
        }

    func webViewDidStartLoad(_ webView: UIWebView) {
        carRoadActivityIndicatorOutlet.stopAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        carRoadActivityIndicatorOutlet.stopAnimating()
    }
}
