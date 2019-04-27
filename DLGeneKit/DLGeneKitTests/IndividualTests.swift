//
//  IndividualTests.swift
//  DLGeneKitTests
//
//  Created by Rodney Dyer on 4/27/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import XCTest

class IndividualTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit() {
        
        let ind = Individual()
        
        ind.set(key: "Population", val: "Richmond")
        
        XCTAssertFalse( ind.coordinate.isValid )
        XCTAssertEqual( ind.data(key: "Population"), "Richmond")
        XCTAssertEqual( ind.data(key: "State"), "")
    
        XCTAssertEqual( String("\(ind)"), "Richmond")
        ind.set(key: "State", val: "Virginia")
        XCTAssertEqual( String("\(ind)"), "Richmond,Virginia")
        
        ind.set(key: "Population", val: "Olympia")
        XCTAssertEqual(ind.data(key: "Population"), "Olympia")
        
    }


}
