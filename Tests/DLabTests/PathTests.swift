//
//  PathTests.swift
//  
//
//  Created by Rodney Dyer on 8/10/22.
//

import XCTest

@testable import DLab

final class PathTests: XCTestCase {

    func testPath() throws {
        
        let path = Path()
        path.destination = Node(label: "B", size: 2)
        path.previous = nil 
        path.length = 3.0
        
        print("\(path)")
        
    }


}
