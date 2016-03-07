//
//  SettingsViewController.swift
//  ParkingGent
//
//  Created by Orjan De Smet on 7/03/16.
//  Copyright © 2016 Orjan De Smet. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var dataSourceText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSourceText.text = ODSParkingAPI.sharedInstance.dataSourceUri
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonPressed(sender: AnyObject) {
        if let newUri = dataSourceText.text
        {
            ODSParkingAPI.sharedInstance.dataSourceUri = newUri
        }
        
        self.view.endEditing(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
