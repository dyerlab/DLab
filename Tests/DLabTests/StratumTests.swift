//
//  StratumTests.swift
//  
//
//  Created by Rodney Dyer on 5/10/22.
//

import XCTest
@testable import DLab

class StratumTests: XCTestCase {

    
    func testNULL() throws {
        let stratum = Stratum()
        XCTAssertEqual( stratum.count, 0)
        XCTAssertEqual( stratum.header, [String]() )
    }
    
    func testArapat() throws {
        let data = Stratum.DefaultStratum()
        let headers = ["Population", "Region", "Longitude", "Latitude", "AML", "ATPS", "EF", "EN", "LTRS", "MP20", "WNT", "ZMP"]
        XCTAssertEqual( data.count, 10)
        XCTAssertEqual( data.header, headers)
        
        if let freq = data.frequencies["AML"] {
            print("\(freq)")
        }
        
    }

    
    func testInitFamily() throws {
        
        let mom = Individual()
        mom.loci["Loc1"] = Genotype(raw: "A:A")
        mom.loci["Loc2"] = Genotype(raw: "A:B")
        
        let family = Stratum(mom: mom )
        
        let off1 = Individual()
        off1.loci["Loc1"] = Genotype(raw: "A:A")
        off1.loci["Loc2"] = Genotype(raw: "A:B")
        
        
        family.addOffspring(offspring: off1 )
        XCTAssertEqual( off1.loci["Loc1", default: Genotype()].masking, .MotherLeft )
        
        
        
        print("famof1:\n\(family)")
        
    }
    
    
    
    func testDefault() throws {
        
        let data = Stratum.DefaultFamily()
        print("The Family: \n \(data)")
        XCTAssertEqual( data.count, 15 )
        
        print("loci: \(data.frequencies.keys.sorted())")
        
        if let freqs = data.frequencies["cf020"] {
            print("Pollen Frequencies:\n\(freqs)")
        }
        
        
    }
    
    
}
