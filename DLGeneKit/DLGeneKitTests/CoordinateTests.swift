//
//  CoordinateTests.swift
//  DLGeneKitTests
//
//  Created by Rodney Dyer on 4/27/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import XCTest
import MapKit

class CoordinateTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit() {
        var coord = Coordinate()
        
        XCTAssertFalse( coord.isValid )
        let clcoord1 = CLLocationCoordinate2D( coord )
        XCTAssertFalse( CLLocationCoordinate2DIsValid(clcoord1) )
        
        coord.latitude = -77.4
        XCTAssertFalse( coord.isValid )
        coord.longitude = 34.5
        XCTAssertTrue( coord.isValid )
        
        let clcoord2 = CLLocationCoordinate2D( coord )
        XCTAssertTrue( CLLocationCoordinate2DIsValid(clcoord2) )
        
        
        let coord2 = Coordinate(lat: 37, lon: -77  )
        XCTAssertTrue( coord2.isValid )
        
        let coord3 = Coordinate( clcoord2 )
        XCTAssertTrue( coord3.isValid )
        
    }

}
