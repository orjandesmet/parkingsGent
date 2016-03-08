//
//  ODSParkingCell.swift
//  ParkingGent
//
//  Created by Orjan De Smet on 8/03/16.
//  Copyright © 2016 Orjan De Smet. All rights reserved.
//

import UIKit

class ODSParkingCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func fillParkingValues(parking : ODSParking)
    {
        self.textLabel!.text = parking.name
        self.detailTextLabel!.text = "\(parking.parkingStatus!.availableCapacity!)"
        
        let percentage = CGFloat(parking.parkingStatus!.availableCapacity!) / CGFloat(parking.parkingStatus!.totalCapacity!)
        
        self.detailTextLabel!.textColor = UIColor(red: 1.0 - percentage, green: percentage, blue: 0.0, alpha: 1.0)
    }

}
