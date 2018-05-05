//
//  DropDownTableViewCell.swift
//  Car Life
//
//  Created by Sium on 7/19/17.
//  Copyright © 2017 mobioapp. All rights reserved.
//

import UIKit

class DropDownVehicleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dropVehicleOutlet: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    
}

class DropDownDistrictTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dropDistrictOutlet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
}
class DropDownAreaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dropAreaOutlet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}

class DropDownWorkshopTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var dropWorkshopOutlet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
}
//My appointments tableview cell class

class MyAppointmentsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var vehicleNameLabel: UILabel!
    
    @IBOutlet weak var districtNameLabel: UILabel!
   
    @IBOutlet weak var areaNameLabel: UILabel!
   
    @IBOutlet weak var workshopNamelabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    

    
    
}
