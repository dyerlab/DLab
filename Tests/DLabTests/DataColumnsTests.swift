//
//  DataColumnsTests.swift
//  
//
//  Created by Rodney Dyer on 10/29/22.
//
@testable import DLab

import XCTest

final class DataColumnsTests: XCTestCase {



    func testInit() throws {
        guard let path = Bundle.module.path(forResource: "arapat", ofType: "csv") else {
            print("Could not load path for resource 'arapat.csv'")
            return
        }
        print("Path to CSV: \(path)")
        XCTAssertFalse( path.isEmpty )
        let reader = CSVReader(path: path)
        
        XCTAssertEqual( reader.contents.count, 364)
        XCTAssertEqual( reader.contents[0].count, 14)
        let dcols = DataColumns(raw: reader.contents )
        
        XCTAssertTrue( dcols.isSpatial )
        XCTAssertTrue( dcols.hasID )
        XCTAssertEqual( dcols.longitude!, 5)
        XCTAssertEqual( dcols.latitude!, 4)
        XCTAssertEqual( dcols.strata, [0,1,2])
        XCTAssertEqual( dcols.loci, [6,7,8,9,10,11,12,13] )
    }


}
