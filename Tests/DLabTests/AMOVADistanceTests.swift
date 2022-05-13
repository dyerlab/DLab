//
//  AMOVADistanceTests.swift
//
//
//  Created by Rodney Dyer on 5/13/22.
//

@testable import DLab
import XCTest

class AMOVADistanceTests: XCTestCase {
    func testExample() throws {
        let loci = [Genotype(raw: "A:A"),
                    Genotype(raw: "A:B"),
                    Genotype(raw: "A:C"),
                    Genotype(raw: "B:B"),
                    Genotype(raw: "B:C"),
                    Genotype(raw: "C:C")]

        let M = Matrix(6, 6)
        for i in 0 ..< 6 {
            for j in 0 ..< 6 {
                M[i, j] = amovaDistance(geno1: loci[i], geno2: loci[j])
            }
        }
        M.rowNames = ["AA", "AB", "AC", "BB", "BC", "CC"]
        M.colNames = M.rowNames
        XCTAssertEqual(M.values, [0.0, 1.0, 1.0, 4.0, 3.0, 4.0, 1.0, 0.0, 1.0, 1.0, 1.0, 3.0, 1.0, 1.0, 0.0, 3.0, 1.0, 1.0, 4.0, 1.0, 3.0, 0.0, 1.0, 4.0, 3.0, 1.0, 1.0, 1.0, 0.0, 1.0, 4.0, 3.0, 1.0, 4.0, 1.0, 0.0])
        XCTAssertEqual(amovaDistance(geno1: Genotype(raw: "A:B"), geno2: Genotype(raw: "C:D")), 2.0)
    }
}
