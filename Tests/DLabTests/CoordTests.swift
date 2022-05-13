//
//  CoordTests.swift
//  
//
//  Created by Rodney Dyer on 5/13/22.
//

import XCTest
@testable import DLab

class CoordTests: XCTestCase {
    
    
    
    func testNull() throws {
        let coord = Coordinate()
        XCTAssertTrue( coord.isEmpty )
    }
    
    func testFull() throws {
        let coord = Coordinate(longitude: -77, latitude: 36)
        XCTAssertFalse( coord.isEmpty )
    }
    
    
    
}
