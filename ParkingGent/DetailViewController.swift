//
//  DetailViewController.swift
//  ParkingGent
//
//  Created by Orjan De Smet on 7/03/16.
//  Copyright © 2016 Orjan De Smet. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem as? ODSParking {
            
            if let nameLabel = self.nameLabel
            {
                nameLabel.text = detail.name
            }
            
            if let addressLabel = self.addressLabel
            {
                addressLabel.text = detail.address
            }
            
            if let contactLabel = self.contactLabel
            {
                contactLabel.text = detail.contactinfo
            }
            
            if let mapView = self.mapView
            {
                let location = CLLocationCoordinate2D(latitude: Double(detail.latitude!), longitude: Double(detail.longitude!))
                // Drop a pin
                let dropPin = MKPointAnnotation()
                dropPin.coordinate = location
                dropPin.title = detail.name
                mapView.addAnnotation(dropPin)
                mapView.showsUserLocation = true
                
                // Zoom in on location
                let viewRegion = MKCoordinateRegionMakeWithDistance(location, 500, 500);
                let adjustedRegion = self.mapView.regionThatFits(viewRegion)
                self.mapView.setRegion(adjustedRegion, animated: true)
            }
            
            self.title = detail.name
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

