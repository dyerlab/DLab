//
//  IndividualTests.swift
//  
//
//  Created by Rodney Dyer on 5/10/22.
//

import XCTest
@testable import DLab

class IndividualTests: XCTestCase {
    
    
    func testNull() throws {
        let ind = Individual()
        XCTAssertNil( ind.coord )
        XCTAssertEqual( ind.loci.keys.sorted(), [String]() )
        XCTAssertEqual( ind.strata.keys.sorted(), [String]() )
    }
    
    
    func testDefault() throws {
        
        let ind = Individual.Default()
        XCTAssertEqual( ind.strata.keys.sorted(), ["Population","Region"])
        XCTAssertEqual( ind.coord!.latitude, 36.0)
        XCTAssertEqual( ind.coord!.longitude, -77.0)
        XCTAssertEqual( ind.coord!.elevation, 42.0)
        XCTAssertTrue( ind.coord!.hasElevation )
        XCTAssertEqual( ind.loci.keys.sorted(), ["LTRS", "WNT", "EN", "EF", "ZMP", "AML"].sorted() )
        print("\(ind)")
        
    }
    
}
