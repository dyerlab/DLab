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


}
