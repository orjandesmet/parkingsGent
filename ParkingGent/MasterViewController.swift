//
//  MasterViewController.swift
//  ParkingGent
//
//  Created by Orjan De Smet on 7/03/16.
//  Copyright © 2016 Orjan De Smet. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    
    var parkings = [ODSParking]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        parkings = ODSParkingAPI.sharedInstance.getParkings()
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let parking = parkings[indexPath.row]
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = parking
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parkings.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
// TODO can move to specific cell
        let parking = parkings[indexPath.row]
        cell.textLabel!.text = parking.name
        cell.detailTextLabel!.text = "\(parking.parkingStatus!.availableCapacity!)"
        
        let percentage = CGFloat(parking.parkingStatus!.availableCapacity!) / CGFloat(parking.parkingStatus!.totalCapacity!)
        
        cell.detailTextLabel!.textColor = UIColor(red: 1.0 - percentage, green: percentage, blue: 0.0, alpha: 1.0)
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    @IBAction func refreshPressed(sender: AnyObject) {
        ODSParkingAPI.sharedInstance.loadData()
        parkings = ODSParkingAPI.sharedInstance.getParkings()
        tableView.reloadData()
    }

}

