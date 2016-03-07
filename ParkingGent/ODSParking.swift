//
//  ODSParking.swift
//  ParkingsGent
//
//  Created by Orjan De Smet on 6/03/16.
//  Copyright © 2016 Orjan De Smet. All rights reserved.
//

import UIKit

class ODSParking {
    
    var name : String?
    var latitude : Float?
    var longitude : Float?
    var address : String?
    var contactinfo : String?
    var parkingStatus : ODSParkingStatus?
    var distance : Float = 0.0
    
    init(json: NSDictionary) {
        
        if let name = json["name"] as? String
        {
            self.name = name
        }
        
        if let latitude = json["latitude"] as? Float
        {
            self.latitude = latitude
        }
        
        if let longitude = json["longitude"] as? Float
        {
            self.longitude = longitude
        }
        
        if let address = json["address"] as? String
        {
            self.address = address
        }
        
        if let contactinfo = json["contactInfo"] as? String
        {
            self.contactinfo = contactinfo
        }
        
        if let parkingStatus = json["parkingStatus"] as? NSDictionary
        {
            self.parkingStatus = ODSParkingStatus(json: parkingStatus)
        }
        else
        {
            self.parkingStatus = ODSParkingStatus(availableCapacity: 0, totalCapacity: 0)
        }
    }
    
}
