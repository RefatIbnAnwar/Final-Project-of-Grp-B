//
//  BuyNowViewController.swift
//  Car Life
//
//  Created by Mobio on 7/18/17.
//  Copyright © 2017 mobioapp. All rights reserved.
//

import UIKit

class BuyNowViewController: UIViewController ,UIWebViewDelegate{
    
    
    @IBOutlet weak var activityIndicatorOutlet: UIActivityIndicatorView!
    
    @IBOutlet weak var buyNowWebview: UIWebView!
    
    
    
    // it is used to remove time and battery from the view Controller
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicatorOutlet.hidesWhenStopped = true
        
        buyNowWebview.delegate = self
        
        
        let url = NSURL(string: "https://www.google.com")
        buyNowWebview.loadRequest(NSURLRequest(url: url! as URL) as URLRequest)
        
        self.navigationItem.title = "Buy Now"
        let backButton = UIBarButtonItem()
        
        backButton.title = "Back"
        
        self.navigationController!.navigationBar.topItem!.backBarButtonItem = backButton
        
        
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        activityIndicatorOutlet.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        activityIndicatorOutlet.stopAnimating()
    }
    
}
