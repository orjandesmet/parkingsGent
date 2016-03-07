//
//  ODSParkingAPI.swift
//  ParkingsGent
//
//  Created by Orjan De Smet on 6/03/16.
//  Copyright © 2016 Orjan De Smet. All rights reserved.
//

import UIKit

class ODSParkingAPI: NSObject {

    static let sharedInstance = ODSParkingAPI()
    private override init() {}
    
    let parkingManager = ODSParkingManager()
    
    func getParkings() -> [ODSParking]
    {
        if (true) // if location
        {
            return parkingManager.getParkingsByDistance()
        }
        else
        {
            return parkingManager.getParkingsAlphabetically()
        }
    }
}
