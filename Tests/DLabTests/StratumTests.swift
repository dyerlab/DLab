//
//  StratumTests.swift
//  
//
//  Created by Rodney Dyer on 5/10/22.
//

import XCTest
@testable import DLab

class StratumTests: XCTestCase {

    
    func testNULL() throws {
        let stratum = Stratum()
        XCTAssertEqual( stratum.count, 0)
        XCTAssertEqual( stratum.header, [String]() )
    }
    
    func testArapat() throws {
        let data = Stratum.DefaultStratum()
        let headers = ["Population", "Region", "Longitude", "Latitude", "Elevation", "AML", "ATPS", "EF", "EN", "LTRS", "MP20", "WNT", "ZMP"]
        XCTAssertEqual( data.count, 10)
        XCTAssertEqual( data.header, headers)
        
        
        
    }

}
