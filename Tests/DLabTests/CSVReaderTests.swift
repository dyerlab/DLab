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
        
        
    }

}
