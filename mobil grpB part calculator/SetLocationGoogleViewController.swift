//
//  SetLocationGoogleViewController.swift
//  mobil grpB part calculator
//
//  Created by Mobioapp on 7/19/17.
//  Copyright © 2017 Mobioapp. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps
import Alamofire
import SwiftyJSON
import CoreLocation

class SetLocationGoogleViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: GMSMapView!
    
    
    let locationManager = CLLocationManager()
    var latValue = CLLocationDegrees()
    var longValue = CLLocationDegrees()
    var addressInfo = ""
    var distance = CLLocationDistance()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(withLatitude: 23.70, longitude: 90.36, zoom: 10.0)
        mapView.camera = camera
        mapView.delegate = self
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        getCurrentLocation()
        
        //for back button
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController!.navigationBar.topItem!.backBarButtonItem = backButton


    }
    
    // delegate of mapView
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        let marker = GMSMarker(position: coordinate)
        marker.title = "Hello World"
        marker.map = mapView
        
        print("Tapped at coordinate: " + String(coordinate.latitude) + " "
            + String(coordinate.longitude))
        
        reverseGEOCode(latitude: coordinate.latitude, longitude: coordinate.longitude)
        distance = calculateDistance(userLat: latValue, userLong: longValue, destinationLat: coordinate.latitude, destinationLong: coordinate.longitude)
        
        
    }
    
    // function
    
    func getCurrentLocation() {
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization() // Call the authorizationStatus() class
        
        if CLLocationManager.locationServicesEnabled() { // get my current locations lat, lng
            
            let lat = locationManager.location?.coordinate.latitude
            let long = locationManager.location?.coordinate.longitude
            if let lattitude = lat  {
                if let longitude = long {
                    latValue = lattitude
                    longValue = longitude
                } else {
                    
                }
            } else {
                
                print("problem to find lat and lng")
            }
            
        }
        else {
            print("Location Service not Enabled. Plz enable u'r location services")
        }
    }
    
    
    
    
    

    
    

    
        func reverseGEOCode(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        
        let loc: CLLocation = CLLocation(latitude: latitude, longitude: longitude)
        
        let ceo: CLGeocoder = CLGeocoder()
        
        ceo.reverseGeocodeLocation(loc, completionHandler:
            {(placemarks, error) in
                if (error != nil)
                {
                    print("reverse geodcode fail: \(error!.localizedDescription)")
                }
                let pm = placemarks! as [CLPlacemark]
                
                if pm.count > 0 {
                    let pm = placemarks![0]

                    var addressString : String = ""
                    if pm.name != nil {
                        addressString = addressString + pm.name! + ", "
                    }
                    if pm.subLocality != nil {
                        addressString = addressString + pm.subLocality! + ", "
                    }
                    
                    if pm.subThoroughfare != nil {
                        addressString = addressString + pm.subThoroughfare! + ", "
                    }
                    if pm.thoroughfare != nil {
                        addressString = addressString + pm.thoroughfare! + ", "
                    }
                    if pm.locality != nil {
                        addressString = addressString + pm.locality! + ", "
                    }
                    if pm.subAdministrativeArea != nil {
                        addressString = addressString + pm.subAdministrativeArea! + ", "
                    }
                    
                    if pm.administrativeArea != nil {
                        addressString = addressString + pm.administrativeArea! + ", "
                    }
                    if pm.country != nil {
                        addressString = addressString + pm.country! + ", "
                    }
                    if pm.postalCode != nil {
                        addressString = addressString + pm.postalCode! + " "
                    }
                    
                    
                    print(addressString)
                    self.addressInfo = addressString
                }
        })
        
    }
    
    func calculateDistance(userLat: CLLocationDegrees, userLong: CLLocationDegrees, destinationLat: CLLocationDegrees , destinationLong: CLLocationDegrees) -> CLLocationDistance {
        
        let userLocation = CLLocation(latitude: userLat, longitude: userLong)
        let tappedLocation = CLLocation(latitude: destinationLat, longitude: destinationLong)
        let distance = userLocation.distance(from: tappedLocation)/1000
        return distance
    }
    
    
    
    
    
    
    
    
    
    
}





