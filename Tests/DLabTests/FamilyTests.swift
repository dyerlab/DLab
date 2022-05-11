//
//  FamilyTests.swift
//  
//
//  Created by Rodney Dyer on 5/11/22.
//

import XCTest
@testable import DLab

class FamilyTests: XCTestCase {

    func testInit() throws {
        
        let mom = Individual()
        mom.loci["Loc1"] = Genotype(raw: "A:A")
        mom.loci["Loc2"] = Genotype(raw: "A:B")
        
        let family = Family(mother: mom )
        
        let off1 = Individual()
        off1.loci["Loc1"] = Genotype(raw: "A:A")
        off1.loci["Loc2"] = Genotype(raw: "A:B")
        
        
        family.addOffspring(offspring: off1 )
        XCTAssertEqual( off1.loci["Loc1", default: Genotype()].masking, .MotherLeft )
        
    }
    
    
    
    func testDefault() throws {
        
        let data = Family.DefaultFamily()
        
        print("\(data)")
        XCTAssertEqual( data.count, 15 )
        
        
    }

}
