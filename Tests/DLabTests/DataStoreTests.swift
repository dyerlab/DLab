//
//  DataStoreTests.swift
//  
//
//  Created by Rodney Dyer on 5/13/22.
//

import XCTest
@testable import DLab

class DataStoreTests: XCTestCase {

    
    func testAdding() throws {
        
        let data = DataStore()
        
        let mom = Individual.DefaultMom()
        let off = Individual.DefaultOffspring()
        
        data.addIndiviudal(ind: mom )
        data.addIndiviudal(ind: off)
        
        XCTAssertEqual( data.strataKeys, ["Big Bertha"] )

        
    }
    
    func testNoStratum() throws {
        let data = DataStore()
        let stratum = data.stratum(named: "Bob")
        XCTAssertTrue( stratum.isEmpty )
    }

    func testExample() throws {
        
        let data = DataStore.Default()
        
        XCTAssertEqual( data.numInds, 365 )
        XCTAssertEqual( data.count, 39 )
        
        
        XCTAssertEqual( data.strataKeys, ["9", "12", "32", "48",
                                          "51", "58", "64", "73",
                                          "75", "77", "84", "88",
                                          "89", "93", "98", "101",
                                          "102", "153", "156", "157",
                                          "159", "160", "161", "162",
                                          "163", "164", "165", "166",
                                          "168", "169", "171", "173",
                                          "175", "177", "Aqu", "Const",
                                          "ESan", "Mat", "SFr"])
        XCTAssertEqual( data.locusKeys, ["AML", "ATPS", "EF", "EN",
                                         "LTRS", "MP20", "WNT", "ZMP"] )
        
        
    }
    
    
    func testFrequencies() throws {
        
        let data = DataStore.Default()
        XCTAssertEqual( data.count, 39 )
        XCTAssertEqual( data.numInds, 365 )
        XCTAssertFalse( data.isEmpty )
        
        let missingFreq = data.frequencysFor(locus: "bob")
        XCTAssertTrue( missingFreq.isEmpty)
        
        let fLTRS = data.frequencysFor(locus: "LTRS")
        print("\(fLTRS)")
        XCTAssertEqual( fLTRS.alleles, ["1","2"])
        XCTAssertEqual( fLTRS.frequency(allele: "1"), 381.0 / 730.0 )
    }
    
    func testFrequencyMatrix() throws {
        
        let data = DataStore.Default()
        XCTAssertEqual( data.count, 39 )
        
        let fMat = data.frequencyMatrixFor(locus: "LTRS")
        XCTAssertEqual( data.count, fMat.rows)
        XCTAssertEqual( fMat.colNames, ["1","2"])
    }
    
    func testGenotypeMatix() throws {
        let data = DataStore.Default()
        let gMat = data.genotypeMatrixFor(locus: "LTRS")
        XCTAssertEqual( data.count, gMat.rows)
        XCTAssertEqual( gMat.colNames, ["1:1","1:2","2:2"])
        print("\(gMat)")
        
        
    }

}
