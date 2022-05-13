//
//  FrequencyTests.swift
//
//
//  Created by Rodney Dyer on 5/12/22.
//

@testable import DLab
import XCTest
class FrequencyTests: XCTestCase {
    func testInitFixed() throws {
        let data = Stratum.DefaultStratum()

        XCTAssertEqual(data.frequencies.count, 8)
        let freqs = data.frequencies["LTRS", default: AlleleFrequencies()]
        XCTAssertEqual(freqs.alleles, ["1"])
        XCTAssertEqual(freqs.frequency(allele: "1"), 1.0)
        XCTAssertEqual(freqs.frequency(allele: "0"), 0.0)
        XCTAssertEqual(freqs.frequencies(alleles: ["1", "2"]), [1.0, 0.0])
        XCTAssertEqual(freqs.numHets, 0.0)
        XCTAssertEqual(freqs.numDiploid, 10.0)
        print("Fixed:\n\(freqs)")
    }

    func testInitVariable() throws {
        let data = Stratum.DefaultStratum()

        XCTAssertEqual(data.frequencies.count, 8)
        let freqs = data.frequencies["MP20", default: AlleleFrequencies()]
        XCTAssertEqual(freqs.alleles, ["5", "7"])
        XCTAssertEqual(freqs.frequency(allele: "1"), 0.0)
        XCTAssertEqual(freqs.frequency(allele: "5"), 5.0 / 20.0)
        XCTAssertEqual(freqs.frequency(allele: "7"), 1.0 - freqs.frequency(allele: "5"))
        XCTAssertEqual(freqs.frequencies(alleles: ["5", "7"]), [5.0 / 20.0, 15.0 / 20.0])
        XCTAssertEqual(freqs.numHets, 3.0)
        XCTAssertEqual(freqs.numDiploid, 10.0)
        print("Variable:\n\(freqs)")
    }

    func testInitFamily() throws {
        let data = Stratum.DefaultFamily()

        print("Family:\n\(data)")
        XCTAssertEqual(data.frequencies.count, 9)

        if let freqs = data.frequencies["cf020"] {
            print("Pollen Frequencies:\n\(freqs)")
        } else {
            print("no frequencies")
        }
    }
}
