//
//  ParkingGentTests.swift
//  ParkingGentTests
//
//  Created by Orjan De Smet on 7/03/16.
//  Copyright © 2016 Orjan De Smet. All rights reserved.
//

import XCTest
@testable import ParkingGent

class ParkingGentTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let parkingManager = ODSParkingManager()
        for parking in parkingManager.getParkingsByDistance()
        {
            assert(parking.name != nil)
            assert(parking.address != nil)
            assert(parking.latitude != nil)
            assert(parking.longitude != nil)
            assert(parking.contactinfo != nil)
            assert(parking.parkingStatus != nil)
            assert(parking.parkingStatus!.totalCapacity != nil)
            assert(parking.parkingStatus!.availableCapacity != nil)
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
