//
//  DataStoreTests.swift
//  
//
//  Created by Rodney Dyer on 5/13/22.
//

import XCTest
@testable import DLab

class DataStoreTests: XCTestCase {


    func testExample() throws {
        
        let data = DataStore.Default()
        
        XCTAssertEqual( data.numInds, 365 )
        XCTAssertEqual( data.count, 39 )
        
        let dataSon = data.stratumAtLevel(name: "Region", level: "SON")
        XCTAssertEqual( dataSon.count, 38 )
        print("\(dataSon)")
        
        XCTAssertEqual( data.strataKeys, ["Population","Region"])
        XCTAssertEqual( data.locusKeys, ["AML", "ATPS", "EF", "EN", "LTRS", "MP20", "WNT", "ZMP"] )
        
        XCTAssertEqual( data.strataLevels(name: "Region"), ["CBP","NBP","SBP","SON"])
        
        let regions = data.allStrataForLevel(level: "Region")
        XCTAssertEqual( regions.count, 4)
        
    }

}
