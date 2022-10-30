//
//  CSVReaderTests.swift
//  
//
//  Created by Rodney Dyer on 10/29/22.
//
@testable import DLab
import XCTest

final class CSVReaderTests: XCTestCase {

    func testRawCSV() throws {
        guard let path = Bundle.module.path(forResource: "arapat", ofType: "csv") else {
            print("Could not load path for resource 'arapat.csv'")
            return
        }
        print("Path to CSV: \(path)")
        XCTAssertFalse( path.isEmpty )
        let reader = CSVReader(path: path)
        XCTAssertFalse( reader.contents.isEmpty )
        XCTAssertEqual( reader.contents.count, 364 )
        XCTAssertEqual( reader.contents[0].count, 14)
    }
    
    
    func testDataStore() throws {
        guard let path = Bundle.module.path(forResource: "arapat", ofType: "csv") else {
            print("Could not load path for resource 'arapat.csv'")
            return
        }
        print("Path to CSV: \(path)")
        let reader = CSVReader(path: path)
        
        let ds = reader.asDataStore()
        XCTAssertNotNil( ds )
        XCTAssertEqual( ds?.numInds ?? 0, 363)
        XCTAssertEqual( ds?.strataKeys ?? [""], ["9", "12", "32", "48",
                                                 "51", "58", "64", "73",
                                                 "75", "77", "84", "88",
                                                 "89", "93", "98", "101",
                                                 "102", "153", "156", "157",
                                                 "159", "160", "161", "162",
                                                 "163", "164", "165", "166",
                                                 "168", "169", "171", "173",
                                                 "175", "177", "Aqu", "Const",
                                                 "ESan", "Mat", "SFr"])
        
    }

}
