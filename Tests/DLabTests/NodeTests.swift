//
//  NodeTests.swift
//  
//
//  Created by Rodney Dyer on 8/10/22.
//

@testable import DLab
import XCTest

final class NodeTests: XCTestCase {

    func testNode() throws {
        /*
        let Node_Aqu = Node(label: "Aqu", size: 13.267567610943, coord: [23.28550, -110.10429])
        var Node_73 = Node(label: "73", size: 7.10527775393008, coord: [24.00789, -109.85071])

         */
        
        
        
        let Node_Aqu =  Node(label: "Aqu", size: 13.267567610943)
        let Node_73 = Node(label: "73", size: 7.10527775393008)
        
        XCTAssertEqual(Node_Aqu.label, "Aqu")
        XCTAssertEqual(Node_Aqu.size, 13.267567610943)

        print(String("\(Node_Aqu)"))
        XCTAssertEqual(String("\(Node_Aqu)"), "Aqu: 13.267567610943)")

        XCTAssertFalse(Node_73 == Node_Aqu)

        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted

    }

}
