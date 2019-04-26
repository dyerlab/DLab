//
//  GeneTests.swift
//  DLGeneKitTests
//
//  Created by Rodney Dyer on 4/26/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import XCTest

class GenotypeTests: XCTestCase {

    func testInit() {
        let A = Genotype()
        let B = Genotype("A")
        let C = Genotype("A:B")
        let D = Genotype(["A","B"])
        let E = Genotype(["A","A"])
        let F = Genotype(["B","A"])
        
        XCTAssertTrue( A.isMissing )
        XCTAssertFalse( B.isMissing )
        XCTAssertFalse( C.isMissing )
        
        XCTAssertEqual(A.ploidy, 0)
        XCTAssertEqual(B.ploidy, 1)
        XCTAssertEqual(C.ploidy, 2)
        XCTAssertEqual(D.ploidy, 2)
        
        
        XCTAssertEqual(F, D)
        XCTAssertNotEqual(A,C)
        XCTAssertNotEqual(D,E)
        
        
        let alleles = ["A","B","C","D"]
        let vec1 = A.vector(vals: alleles)
        let vec2 = B.vector(vals: alleles)
        let vec3 = C.vector(vals: alleles)
        let vec4 = E.vector(vals: alleles)
        let vec5 = D.vector(vals: ["A","C"])

        XCTAssertEqual(vec1, [0.0,0.0,0.0,0.0] )
        XCTAssertEqual(vec2, [1.0,0.0,0.0,0.0] )
        XCTAssertEqual(vec3, [1.0,1.0,0.0,0.0] )
        XCTAssertEqual(vec4, [2.0,0.0,0.0,0.0] )
        XCTAssertEqual(vec5, [1.0,0.0] )
        
    }



}
