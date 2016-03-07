//
//  ODSParkingManager.swift
//  ParkingsGent
//
//  Created by Orjan De Smet on 6/03/16.
//  Copyright © 2016 Orjan De Smet. All rights reserved.
//

import UIKit

class ODSParkingManager: NSObject {

    var parkings = [ODSParking]()
    
    override init()
    {
        // TODO URL must be changeable
        let endpoint = NSURL(string: "http://datatank.stad.gent/4/mobiliteit/bezettingparkingsrealtime.json")
        let data = NSData(contentsOfURL: endpoint!)
        
        do {
            if let json: NSArray = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSArray {
                for parking in json
                {
                    if let parkingJson = parking as? NSDictionary
                    {
                        parkings += [ODSParking(json: parkingJson)]
                    }
                }
            }
        } catch {}
    }
    
    func getParkingsByDistance() -> [ODSParking]
    {
        // TODO get current location and sort by distance
        return parkings
    }
    
    func getParkingsAlphabetically() -> [ODSParking]
    {
        // TODO get parkings alphabetically
        return parkings
    }
}
