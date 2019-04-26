//
//  LocusTest.swift
//  DLGeneKitTests
//
//  Created by Rodney Dyer on 4/26/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import XCTest

class LocusTest: XCTestCase {

    func testInit() {
        let A = Genotype(["A","B"])
        let B = Genotype(["A","A"])
        let C = Genotype(["B","A"])
        
        let tpi = Locus()
        
        XCTAssertEqual( tpi.frequencies.A, 0.0 )
        
        tpi.append(A)
        tpi.append(B)
        tpi.append(C)
        
        XCTAssertEqual(tpi.count, 3)
        XCTAssertEqual(tpi[0],A)      
        XCTAssertEqual( tpi.frequencies["B"], 2.0/6.0 )

        tpi[0] = B
        XCTAssertEqual(tpi[0], B)
        XCTAssertEqual( tpi.frequencies["B"], 1.0/6.0 )
        
        
    }


}
