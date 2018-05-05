//
//  ServiceAppoinmentViewController.swift
//  mobil grpB part calculator
//
//  Created by Sium on 7/22/17.
//  Copyright © 2017 Mobioapp. All rights reserved.


import UIKit
import os.log

class ServiceAppointmentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    //properties
    var vehicle = ["Nissan", "Infinity", "Toyota", "Vox Wagen", "Corolla"]
    var district = ["Dhaka","Chandpur","Rajshahi","Tangail","Sirajgonj","Jamalpur","Chittagong","Comilla","Noakhali","Barisal"]
    
    var area = ["Goran","Khilgaon","Basabo","Shyamoli","Mohammadpur","Dhaka Cantonment"]
    
    var workShop = ["Mobil Shop","Petrol Shop","Diesel Shop","Octen Shop"]
    
    var myAppointmentVehicle = ""
    var myAppointmentArea = ""
    var myAppointmentDistrict = ""
    var myAppointmentWorkshop = ""
    var serviceInformation: ServiceInformation?
    
    
    
    @IBOutlet weak var selectVehicleTableView: UITableView!
    @IBOutlet weak var selectVehicleOutlet: UIButton!
    @IBOutlet weak var selectDistrictTableView: UITableView!
    @IBOutlet weak var selectDistrictButtonOutlet: UIButton!
    @IBOutlet weak var selectAreaTableView: UITableView!
    @IBOutlet weak var selectAreaButtonOutlet: UIButton!
    @IBOutlet weak var selectWorkshopTableView: UITableView!
    @IBOutlet weak var selectWorkshopButtonOutlet: UIButton!
    
    @IBOutlet weak var viewDetailsButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //delegate datasource for vehicle table view
        selectVehicleTableView.delegate = self
        selectVehicleTableView.dataSource = self
        
        //delegate datasource for district table view
        selectDistrictTableView.delegate = self
        selectDistrictTableView.dataSource = self
        
        //delegate datasource for area table view
        selectAreaTableView.delegate = self
        selectAreaTableView.dataSource = self
        
        //delegate datasource for workshop table view
        selectWorkshopTableView.delegate = self
        selectWorkshopTableView.dataSource = self
        
        
        
        selectVehicleTableView.isHidden = true
        selectDistrictTableView.isHidden = true
        selectAreaTableView.isHidden = true
        selectWorkshopTableView.isHidden = true
        
        
        self.navigationItem.title = "Service Appointments"
        //for back button
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController!.navigationBar.topItem!.backBarButtonItem = backButton
        
        
        
    }
    
    //Mark: Action
    
    @IBAction func selectVehicleAction(_ sender: Any) {
        
        selectVehicleTableView.isHidden = false
        selectDistrictTableView.isHidden = true
        selectAreaTableView.isHidden = true
        selectWorkshopTableView.isHidden = true
    }
    
    @IBAction func selectDistrictButtonAction(_ sender: Any) {
        selectVehicleTableView.isHidden = true
        selectDistrictTableView.isHidden = false
        selectAreaTableView.isHidden = true
        selectWorkshopTableView.isHidden = true
        
    }
    
    
    @IBAction func selectAreaButtonAction(_ sender: Any) {
        selectVehicleTableView.isHidden = true
        selectDistrictTableView.isHidden = true
        selectAreaTableView.isHidden = false
        selectWorkshopTableView.isHidden = true
    }
    
    
    
    
    @IBAction func selectWorkshopButtonAction(_ sender: Any) {
        selectVehicleTableView.isHidden = true
        selectDistrictTableView.isHidden = true
        selectAreaTableView.isHidden = true
        selectWorkshopTableView.isHidden = false
    }
    
    

    
        
    
    //delegate and datasorce Method
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var count:Int?
        
        if tableView == self.selectVehicleTableView {
            count = vehicle.count
        }
        
        if tableView == self.selectDistrictTableView {
            count =  district.count
        }
        if tableView == self.selectAreaTableView {
            count =  area.count
        }
        if tableView == self.selectWorkshopTableView {
            count =  workShop.count
        }
        return count!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        //var cell:DropDownTableViewCell
        
        if tableView == self.selectVehicleTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "vehicleIdentifierCell", for: indexPath) as! DropDownVehicleTableViewCell
            
            let cellInformation = self.vehicle[indexPath.row]
            cell.dropVehicleOutlet.text = cellInformation
            return cell
            
            
        }
            
        else if tableView == self.selectDistrictTableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "districtCell", for: indexPath) as! DropDownDistrictTableViewCell
            let cellInformation = self.district[indexPath.row]
            cell.dropDistrictOutlet.text = cellInformation
            return cell
            
            
        }
            
        else if tableView == self.selectAreaTableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "areaCell", for: indexPath) as! DropDownAreaTableViewCell
            let cellInformation = self.area[indexPath.row]
            cell.dropAreaOutlet.text = cellInformation
            return cell
            
            
        }
            
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "workshopCell", for: indexPath) as! DropDownWorkshopTableViewCell
            let cellInformation = self.workShop[indexPath.row]
            cell.dropWorkshopOutlet.text = cellInformation
            return cell
            
            
        }
        
        
        
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == selectVehicleTableView
        {
            let selectVehicle = vehicle[indexPath.row]
            selectVehicleOutlet.setTitle(selectVehicle, for: .normal)
            selectVehicleTableView.isHidden = true
            myAppointmentVehicle = selectVehicle
            
        }
        
        if tableView == selectDistrictTableView{
            
            let selectDistrict = district[indexPath.row]
            selectDistrictButtonOutlet.setTitle(selectDistrict, for: .normal)
            selectDistrictTableView.isHidden = true
            //myAppointmentDistrict.append(selectDistrict)
            myAppointmentDistrict = selectDistrict
        }
        if tableView == selectAreaTableView{
            
            let selectArea = area[indexPath.row]
            selectAreaButtonOutlet.setTitle(selectArea, for: .normal)
            selectAreaTableView.isHidden = true
            //myAppointmentArea.append(selectArea)
            myAppointmentArea = selectArea
        }
        
        if tableView == selectWorkshopTableView{
            
            let selectWorkshop = workShop[indexPath.row]
            selectWorkshopButtonOutlet.setTitle(selectWorkshop, for: .normal)
            selectWorkshopTableView.isHidden = true
            //myAppointmentWorkshop.append(selectWorkshop)
            myAppointmentWorkshop = selectWorkshop
        }
        
    }
    
    @IBAction func viewDetailsTapped(_ sender: Any) {
       
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let myAppointmentsVc = segue.destination as! MyAppointmentsViewController
//        myAppointmentsVc.vehicleText = myAppointmentVehicle
//        myAppointmentsVc.districtText = myAppointmentDistrict
//        myAppointmentsVc.areaText = myAppointmentArea
//        myAppointmentsVc.workshopText = myAppointmentWorkshop
//    }
    
    //Mark: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        //Configure the destination view controller only when the save button is pressed
        guard let button = sender as? UIButton, button === viewDetailsButton else {
            os_log("the view details button was not pressed", log: OSLog.default, type: .debug)
            return
        }
        
        let vehicleName = myAppointmentVehicle
        let districtName = myAppointmentDistrict
        let area = myAppointmentArea
        let workshop = myAppointmentWorkshop
        
        //set the meal to be passed to MealTableViewController after the unwind segue
        if (myAppointmentVehicle != "" && myAppointmentDistrict != "" && myAppointmentArea != "" && myAppointmentWorkshop != "") {
            
            serviceInformation = ServiceInformation(vehicleNameInit: vehicleName, districtNameInit: districtName, areaNameInit: area, workShopNameInit: workshop)
        }
    }

    
    
    
    
}
