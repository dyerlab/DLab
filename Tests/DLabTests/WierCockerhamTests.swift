//
//  WierCockerhamTests.swift
//  
//
//  Created by Rodney Dyer on 7/20/22.
//

@testable import DLab
import XCTest

final class WierCockerhamTests: XCTestCase {


    func testWC() throws {
        let store = DataStore.Default()
        let son101 = store.stratum(named: "101")
        let son102 = store.stratum(named: "102")
        
        
        var inds = son101.individuals
        inds.append(contentsOf: son102.individuals )
        
        for ind in inds {
            print("\(ind)")
        }
        
        
        var locales = Array(repeating: "101", count: son101.count )
        locales.append(contentsOf:  Array( repeating: "102", count: son102.count))
        
        
        let wc = WierCockerham(genotypes: inds.getGenotypes(named: "LTRS"), partitions: locales )
        
        print("\(wc)")
        
        print("\(wc.C)")

    }


}
