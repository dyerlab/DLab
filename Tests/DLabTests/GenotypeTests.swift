//
//  dyerlab.org                                          @dyerlab
//                      _                 _       _
//                   __| |_   _  ___ _ __| | __ _| |__
//                  / _` | | | |/ _ \ '__| |/ _` | '_ \
//                 | (_| | |_| |  __/ |  | | (_| | |_) |
//                  \__,_|\__, |\___|_|  |_|\__,_|_.__/
//                        |_ _/
//
//         Making Population Genetic Software That Doesn't Suck
//
//  GenotypeTests.swift
//
//
//  Created by Rodney Dyer on 5/10/22.
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <https://www.gnu.org/licenses/>.

@testable import DLab
import XCTest

class GenotypeTests: XCTestCase {
    func testNull() throws {
        let geno = Genotype()
        XCTAssertTrue(geno.isEmpty)
        XCTAssertFalse(geno.isHeterozygote)
        XCTAssertEqual(String("\(geno)"), "-")
        XCTAssertEqual(geno.ploidy, .Missing)
        XCTAssertEqual(geno, Genotype())
        XCTAssertEqual(geno.asVector(alleles: ["A", "B", "C"]), [0.0, 0.0, 0.0])
    }

    func testHaplid() throws {
        let geno = Genotype(raw: "A")
        XCTAssertFalse(geno.isEmpty)
        XCTAssertFalse(geno.isHeterozygote)
        XCTAssertEqual(String("\(geno)"), "A")
        XCTAssertEqual(geno.ploidy, .Haploid)
        XCTAssertEqual(geno, Genotype(raw: "A"))
        XCTAssertEqual(geno.asVector(alleles: ["A", "B", "C"]), [1.0, 0.0, 0.0])
    }

    func testHeterozygote() throws {
        let geno = Genotype(raw: "A:B")
        XCTAssertFalse(geno.isEmpty)
        XCTAssertTrue(geno.isHeterozygote)
        XCTAssertEqual(String("\(geno)"), "A:B")
        XCTAssertEqual(geno.ploidy, .Diploid)
        XCTAssertEqual(geno, Genotype(raw: "A:B"))
        XCTAssertEqual(geno.asVector(alleles: ["A", "B", "C"]), [1.0, 1.0, 0.0])
    }

    func testHomozygote() throws {
        let geno = Genotype(raw: "A:A")
        XCTAssertFalse(geno.isEmpty)
        XCTAssertFalse(geno.isHeterozygote)
        XCTAssertEqual(String("\(geno)"), "A:A")
        XCTAssertEqual(geno.ploidy, .Diploid)
        XCTAssertEqual(geno, Genotype(raw: "A:A"))
        XCTAssertEqual(geno.asVector(alleles: ["A", "B", "C"]), [2.0, 0.0, 0.0])
    }

    func testAMOVADistances() throws {
        let AA = Genotype(raw: "A:A")
        let AB = Genotype(raw: "A:B")
        let BB = Genotype(raw: "B:B")
        let BC = Genotype(raw: "B:C")
        let CD = Genotype(raw: "C:D")

        XCTAssertEqual(amovaDistance(geno1: AA, geno2: AA), 0.0)
        XCTAssertEqual(amovaDistance(geno1: AA, geno2: AB), 1.0)
        XCTAssertEqual(amovaDistance(geno1: AB, geno2: AA), 1.0)
        XCTAssertEqual(amovaDistance(geno1: AA, geno2: BB), 4.0)
        XCTAssertEqual(amovaDistance(geno1: AB, geno2: BC), 1.0)
        XCTAssertEqual(amovaDistance(geno1: AA, geno2: BC), 3.0)
        XCTAssertEqual(amovaDistance(geno1: AB, geno2: CD), 2.0)
    }
}
