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
        
        
        XCTAssertEqual( data.strataKeys, ["9", "12", "32", "48",
                                          "51", "58", "64", "73",
                                          "75", "77", "84", "88",
                                          "89", "93", "98", "101",
                                          "102", "153", "156", "157",
                                          "159", "160", "161", "162",
                                          "163", "164", "165", "166",
                                          "168", "169", "171", "173",
                                          "175", "177", "Aqu", "Const",
                                          "ESan", "Mat", "SFr"])
        XCTAssertEqual( data.locusKeys, ["AML", "ATPS", "EF", "EN",
                                         "LTRS", "MP20", "WNT", "ZMP"] )
        
        
    }

}
