//
//  ODSParkingAPI.swift
//  ParkingsGent
//
//  Created by Orjan De Smet on 6/03/16.
//  Copyright © 2016 Orjan De Smet. All rights reserved.
//

import UIKit
import MapKit

let defaultUri = "http://datatank.stad.gent/4/mobiliteit/bezettingparkingsrealtime.json"

class ODSParkingAPI: NSObject, CLLocationManagerDelegate {

    static let sharedInstance = ODSParkingAPI()
    private override init()
    {
        
        if let dataSourceUri = NSUserDefaults.standardUserDefaults().valueForKey("dataSourceUri") as? String
        {
            self.dataSourceUri = dataSourceUri
        }
        else
        {
            dataSourceUri = defaultUri
        }
        super.init()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        loadData()
    }
    
    var dataSourceUri : String {
        
        didSet {
            loadData()
            
            NSUserDefaults.standardUserDefaults().setValue(dataSourceUri, forKey: "dataSourceUri")
        }
    }
    
    let parkingManager = ODSParkingManager()
    let locationManager = CLLocationManager()
    
    func getParkings() -> [ODSParking]
    {
        if let currentLocation = locationManager.location
        {
            return parkingManager.getParkingsByDistance(currentLocation)
        }
        else
        {
            return parkingManager.getParkingsAlphabetically()
        }
    }
    
    func loadData()
    {
        parkingManager.loadData(dataSourceUri)
    }
}
