//
//  MyAppointmentViewController.swift
//  mobil grpB part calculator
//
//  Created by Sium on 7/22/17.
//  Copyright © 2017 Mobioapp. All rights reserved.
//

import UIKit
import os.log


class MyAppointmentViewController: UIViewController, UITableViewDataSource , UITableViewDelegate {
    
    var allAppointments = [ServiceInformation]()

    let message = "Tap the plus button for new appointments also fill all the fields properly."
    @IBOutlet weak var myAppointmentTableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //load previous appointments
        if let saveAppointments = loadApointments(){
            allAppointments += saveAppointments
        }
        

        
        myAppointmentTableViewOutlet.delegate = self
        myAppointmentTableViewOutlet.dataSource = self
        
        self.navigationItem.title = "My Appointments"
        //for back button
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController!.navigationBar.topItem!.backBarButtonItem = backButton
        
        
        //toast message
        let toastLabel =
            UILabel(frame:
                CGRect(x: self.view.frame.size.width/2 - 150,
                       y: self.view.frame.size.height-100,
                       width: 200,
                       height: 80))
        toastLabel.backgroundColor = UIColor.black
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = NSTextAlignment.center
        self.view.addSubview(toastLabel)
        toastLabel.text = message
        toastLabel.numberOfLines = 0
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        UIView.animate(withDuration: 4.0, animations: {
            toastLabel.alpha = 0.0
        })
    }
    
    //delegate and datasource method for table view
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allAppointments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myAppointmentCell", for: indexPath) as! MyAppointmentsTableViewCell
        let serviceInformation = allAppointments[indexPath.row]
        cell.vehicleNameLabel.text = serviceInformation.vehicleName
        cell.districtNameLabel.text = serviceInformation.districtName
        cell.areaNameLabel.text = serviceInformation.areaName
        cell.workshopNamelabel.text = serviceInformation.workShopName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            allAppointments.remove(at: indexPath.row)
            saveAppointments()
            myAppointmentTableViewOutlet.deleteRows(at: [indexPath], with: .fade)
        }
        
    }
    
    
    //unwind method
    
    @IBAction func unwindToMyAppointments(sender: UIStoryboardSegue){
        
        if let sourceViewController = sender.source as? ServiceAppointmentViewController, let information = sourceViewController.serviceInformation {
            
            let newIndexPath = IndexPath(row: allAppointments.count, section: 0)
            allAppointments.append(information)
            myAppointmentTableViewOutlet.insertRows(at: [newIndexPath], with:  .automatic)
         
            //save appointments
            saveAppointments()
        }
    }
    
    private func saveAppointments() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(allAppointments, toFile: ServiceInformation.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Appointment successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save Appointment...", log: OSLog.default, type: .error)
        }
    }
    
    private func loadApointments() -> [ServiceInformation]?  {
        return NSKeyedUnarchiver.unarchiveObject(withFile: ServiceInformation.ArchiveURL.path) as? [ServiceInformation]
    }
    
    


    

}
