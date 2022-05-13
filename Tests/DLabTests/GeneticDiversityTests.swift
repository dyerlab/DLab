//
//  GeneticDiversityTests.swift
//
//
//  Created by Rodney Dyer on 5/13/22.
//

@testable import DLab
import XCTest

class GeneticDiversityTests: XCTestCase {
    func testDefault() throws {
        let diversity = GeneticDiversity.Default()
        XCTAssertEqual(diversity.A, 4)
        XCTAssertEqual(diversity.A95, 4)

        let p = [4.0 / 18.0, 1.0 / 18.0, 8.0 / 18.0, 5.0 / 18.0].map { $0 * $0 }
        let he = 1.0 - p.reduce(0.0, +)
        let ho = 7.0 / 9.0
        let ae = 1.0 / (1.0 - he)

        XCTAssertEqual(diversity.Ho, ho)
        XCTAssertEqual(diversity.He, he)
        XCTAssertEqual(diversity.Ae, ae)
        XCTAssertEqual(diversity.F, 1.0 - ho / he)
    }
}
