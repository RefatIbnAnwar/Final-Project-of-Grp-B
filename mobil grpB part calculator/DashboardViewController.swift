//
//  ViewController.swift
//  Car Life
//
//  Created by mobioapp on 7/17/17.
//  Copyright © 2017 mobioapp. All rights reserved.
//

import UIKit
import AVFoundation
import GoogleMobileAds

class DashboardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, GADBannerViewDelegate {
    
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    var torchStatus = false
    
    
   ///// for menu
    var menuShow : MenuViewController!
    var userNameString: String?
        
    //for blur view
    @IBOutlet weak var blurView: UIView!
    
    var dashImages = [UIImage]()
    var dashImageId = [String]()
    var dashtext = ["LubriCant Store Locator", "Service Appoinments", "Find your Oil", "Buy Now", "Reminders", "Calculators(EMI & Mileage)", "Mobil Automotive Products", "Car Maintenance Tips", "Current campaigns", "SOS/Helpline"]
    
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    @IBOutlet weak var menuButtonOutlet: UIBarButtonItem!
    @IBOutlet weak var adView: UIView!
    
    var bannerView: GADBannerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dashImages = [#imageLiteral(resourceName: "Store Locator"), #imageLiteral(resourceName: "Service Appoinments"), #imageLiteral(resourceName: "Find your Oil"), #imageLiteral(resourceName: "Buy Now"), #imageLiteral(resourceName: "Reminders"), #imageLiteral(resourceName: "Calculators(EMI & Mileage)"), #imageLiteral(resourceName: "Mobil Automotive"), #imageLiteral(resourceName: "Car Maintenance Tips"), #imageLiteral(resourceName: "Current campaigns"), #imageLiteral(resourceName: "SOS")]
        
        dashImageId = ["1","2","3","4","5","6","7","8","9","10"]
        
        
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        self.collectionViewOutlet.delegate = self
        self.collectionViewOutlet.dataSource = self
        
        //handling borders
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0)
        layout.itemSize = CGSize(width: screenWidth/2, height: screenWidth/2)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionViewOutlet.collectionViewLayout = layout
        
        
        
        /// for menu view

        menuShow = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        
        //for adMob
        var
        _ = GADRequest()
        bannerView = GADBannerView(adSize: kGADAdSizeFullBanner)
        bannerView.frame = CGRect(x:1/2, y:-1/2, width:320, height:350)
        
        //self.view.addSubview(bannerview)
        bannerView.adUnitID = "ca-app-pub-8501671653071605/1974659335"
        bannerView.rootViewController = self
        
        self.adView.addSubview(bannerView)
        bannerView.load(GADRequest())
        //menu tap and swipe
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeLeft)

        // blur view
        blurView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.view.addSubview(blurView)
        self.blurView.isHidden = true
        
        
        // app variable
        AppDelegate.MenuShowing = true
    }
    
    //delegate and datasource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dashImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DashBoardCell", for: indexPath) as! DashboardCollectionViewCell
        
        cell.dashBoardImageOutlet.image =  dashImages[indexPath.row]
        cell.dashBoardLabelOutlet.text = self.dashtext[indexPath.row]
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.gray.cgColor
   
        return cell
    }
    
    
    // for clicking the specific container of  collection view
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = dashImageId[indexPath.row]
        let vc = storyboard?.instantiateViewController(withIdentifier: item)
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    
    
    
    @IBAction func menuTapped(_ sender: Any) {
        
        
        if(AppDelegate.MenuShowing){
            MenuOn()
        }else{
            MenuOff()
        }

        
    
    }
    
    //flash light
    @IBAction func flashLightButton(_ sender: Any) {
        
        
        if torchStatus == false{
            toggleOn()
            torchStatus = true
            print("Light on")
        }
        else {
            toggleOff()
            torchStatus = false
            print("Light off")
        }
    }
    
    func toggleOn(){
        if let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo), device.hasTorch{
            
            do{
                try device.lockForConfiguration()
                device.torchMode = .on
                device.unlockForConfiguration()
            }
                
            catch{
                print("Error Occured")
                
            }
        }
    }
    
    
    func toggleOff(){
        if let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo), device.hasTorch{
            
            do{
                try device.lockForConfiguration()
                device.torchMode = .off
                device.unlockForConfiguration()
            }
                
            catch{
                print("Error Occured")
                
            }
        }
    }
    

    
    
    func respondToGesture(gesture: UISwipeGestureRecognizer)
    {
        switch gesture.direction {
        case UISwipeGestureRecognizerDirection.right:
            MenuOn()
        case UISwipeGestureRecognizerDirection.left:
            MenuOff()
        default:
            break
        }
        
    }

    func MenuOn()  {
        self.blurView.isHidden = false
        UIView.animate(withDuration: 0.3) { () -> Void in
            self.menuShow.view.frame = CGRect(x: 0, y: 60, width: UIScreen.main.bounds.size.width
                , height: UIScreen.main.bounds.size.height)
            self.view.backgroundColor = UIColor.clear
            self.addChildViewController(self.menuShow)
            self.view.addSubview(self.menuShow.view)
            AppDelegate.MenuShowing = false
        }
    }
    func MenuOff(){
        
        self.blurView.isHidden = true
        UIView.animate(withDuration: 0.3, animations:  {() -> Void in
            self.menuShow.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 60, width: UIScreen.main.bounds.size.width
                , height: UIScreen.main.bounds.size.height) }) {( finished) in
                    self.menuShow.view.removeFromSuperview()
        }
        AppDelegate.MenuShowing = true
    }

    
}

