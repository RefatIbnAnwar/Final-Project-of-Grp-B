//
//  ServiceInformation.swift
//  mobil grpB part calculator
//
//  Created by Sium on 7/22/17.
//  Copyright © 2017 Mobioapp. All rights reserved.
//

import UIKit
import os.log

class ServiceInformation: NSObject, NSCoding  {
    
    //Mark: Type
    
    struct PropertyKey {
        static let vehicleNameProperty = "vehicleName"
        static let districtNameProperty = "districtName"
        static let areaNameProperty = "areaName"
        static let workShopNameProperty = "workShopName"
    }
    
    
    //Mark: properties
    var vehicleName: String
    var districtName: String
    var areaName: String
    var workShopName: String
    
    //Mark: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("allAppointments")
    
    
    init(vehicleNameInit: String, districtNameInit: String , areaNameInit: String, workShopNameInit: String ) {
        
        vehicleName = vehicleNameInit
        districtName = districtNameInit
        areaName = areaNameInit
        workShopName = workShopNameInit
        
    }
    
    //Mark: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(vehicleName, forKey: PropertyKey.vehicleNameProperty)
        aCoder.encode(districtName, forKey: PropertyKey.districtNameProperty)
        aCoder.encode(areaName, forKey: PropertyKey.areaNameProperty)
        aCoder.encode(workShopName, forKey: PropertyKey.workShopNameProperty )
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let  vehicleName = aDecoder.decodeObject(forKey: PropertyKey.vehicleNameProperty) as? String else {
            os_log("Unable to decode the name for a ServiceInformation object.", log: OSLog.default, type: .debug)
            return nil
        }
        let districtName = aDecoder.decodeObject(forKey: PropertyKey.districtNameProperty) as? String
        let areaName = aDecoder.decodeObject(forKey: PropertyKey.areaNameProperty) as? String
        let workShopName = aDecoder.decodeObject(forKey: PropertyKey.workShopNameProperty) as? String
        
        self.init(vehicleNameInit: vehicleName, districtNameInit: districtName!, areaNameInit: areaName!, workShopNameInit: workShopName!)
    }
    
    
    
}
