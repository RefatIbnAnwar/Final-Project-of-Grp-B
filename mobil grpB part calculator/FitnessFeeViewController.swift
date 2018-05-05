//
//  FitnessFeeViewController.swift
//  mobil grpB part calculator
//
//  Created by Mobioapp on 7/18/17.
//  Copyright © 2017 Mobioapp. All rights reserved.
//

import UIKit

class FitnessFeeViewController: UIViewController, UIWebViewDelegate {
   
    
    @IBOutlet weak var fitnessFeeActivityIndicatorOutlet: UIActivityIndicatorView!
    @IBOutlet weak var FitnessFeeWebView: UIWebView!
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
        FitnessFeeWebView.delegate = self
        let url = NSURL(string: "https://www.google.com")
        
        FitnessFeeWebView.loadRequest(NSURLRequest(url: url! as URL) as URLRequest)
        
        //back bar
        self.navigationItem.title = "Fitness Fee"
        let backButton = UIBarButtonItem()
        
        backButton.title = "Back"
        
        self.navigationController!.navigationBar.topItem!.backBarButtonItem = backButton
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        fitnessFeeActivityIndicatorOutlet.startAnimating()
    }

    func webViewDidFinishLoad(_ webView: UIWebView) {
        fitnessFeeActivityIndicatorOutlet.stopAnimating()
    }
    
}
