//
//  ODSParkingManager.swift
//  ParkingsGent
//
//  Created by Orjan De Smet on 6/03/16.
//  Copyright © 2016 Orjan De Smet. All rights reserved.
//

import UIKit
import MapKit

class ODSParkingManager: NSObject {

    var parkings = [ODSParking]()
    
    func loadData(dataSourceUri : String)
    {
        parkings.removeAll()
        
        if let endpoint = NSURL(string: dataSourceUri)
        {
            if let data = NSData(contentsOfURL: endpoint)
            {
                do {
                    if let json: NSArray = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as? NSArray {
                        for parking in json
                        {
                            if let parkingJson = parking as? NSDictionary
                            {
                                parkings += [ODSParking(json: parkingJson)]
                            }
                        }
                    }
                } catch { print(error) }
            }
        }
    }
    
    func getParkingsByDistance(location : CLLocation) -> [ODSParking]
    {
        return parkings.sort { $0.distance(location) < $1.distance(location) }
    }
    
    func getParkingsAlphabetically() -> [ODSParking]
    {
        return parkings.sort { $0.name! < $1.name! }
    }
}
