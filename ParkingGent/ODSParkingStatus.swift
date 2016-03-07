//
//  ODSParkingStatus.swift
//  ParkingsGent
//
//  Created by Orjan De Smet on 6/03/16.
//  Copyright © 2016 Orjan De Smet. All rights reserved.
//

import UIKit

class ODSParkingStatus {

    var availableCapacity : Int?
    var totalCapacity : Int?
    
    init(json: NSDictionary) {
    
        if let availableCapacity = json["availableCapacity"] as? Int
        {
            self.availableCapacity = availableCapacity
        }
        
        if let totalCapacity = json["totalCapacity"] as? Int
        {
            self.totalCapacity = totalCapacity
        }
    }
    
    init(availableCapacity : Int, totalCapacity: Int)
    {
        self.availableCapacity = availableCapacity
        self.totalCapacity = totalCapacity
    }
}
