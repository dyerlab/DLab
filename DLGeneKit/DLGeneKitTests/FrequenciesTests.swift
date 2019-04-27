//
//  FrequenciesTest.swift
//  DLGeneKitTests
//
//  Created by Rodney Dyer on 4/26/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import XCTest

class FrequenciesTest: XCTestCase {

    func testInit() {
        let A = Genotype(["A","B"])
        let B = Genotype(["A","A"])
        let C = Genotype(["B","A"])
        
        
        let freq = Frequencies()
        
        XCTAssertEqual( freq.A, 0.0 )
        XCTAssertEqual( freq.Ae, 0.0 )
        XCTAssertEqual( freq.Ho, 0.0 )
        XCTAssertEqual( freq.He, 0.0 )
        XCTAssertEqual( freq.count, 0 )
        XCTAssertEqual( freq.alleles, [])
        
        freq.addLocus(A)
        freq.addLocus(B)
        freq.addLocus(C)
        
        let p = pow(4.0/6.0, 2.0) + pow(2.0/6.0, 2 )
        XCTAssertEqual( freq.A, 2.0 )
        XCTAssertEqual( freq.Ae, 1.0 / p )
        XCTAssertEqual( freq.Ho, 2.0 / 3.0 )
        XCTAssertEqual( freq.He, 1.0 - p )
        XCTAssertEqual( freq.count, 2 )
        XCTAssertEqual( freq.alleles, ["A","B"])
        XCTAssertEqual( freq["A"], 4.0/6.0 )
        XCTAssertEqual( freq.frequency("A"), 4.0/6.0 )
        
        freq.replaceLocus(old: A, new: B)
        XCTAssertEqual( freq.frequency("A"), 5.0/6.0 )

    }



}
