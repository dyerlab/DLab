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
//  IndividualTests.swift
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

class IndividualTests: XCTestCase {
    func testNull() throws {
        let ind = Individual()
        XCTAssertNil(ind.coord)
        XCTAssertEqual(ind.loci.keys.sorted(), [String]())
        XCTAssertEqual(ind.strata.keys.sorted(), [String]())
    }

    func testDefault() throws {
        let ind = Individual.Default()
        XCTAssertEqual(ind.strata.keys.sorted(), ["Population", "Region"])
        XCTAssertEqual(ind.coord!.latitude, 36.0)
        XCTAssertEqual(ind.coord!.longitude, -77.0)
        XCTAssertEqual(ind.loci.keys.sorted(), ["LTRS", "WNT", "EN", "EF", "ZMP", "AML"].sorted())
        print("\(ind)")
    }
}
