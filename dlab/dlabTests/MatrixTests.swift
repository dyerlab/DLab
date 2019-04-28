//
//  MatrixTests.swift
//  DLGeneKitTests
//
//  Created by Rodney Dyer on 4/27/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import XCTest

class MatrixTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {

        let X = Matrix(rows: 10, cols: 10)
        
        XCTAssertEqual(X.rows, 10)
        XCTAssertEqual(X.cols, 10)
        XCTAssertEqual(X.rownames, nil)
        XCTAssertEqual(X.colnames, nil)
        XCTAssertEqual(X.values, Array(repeating:0.0, count:100))
        
        let values: [Double] = Array( 0 ... 15).map {Double($0) * 1.0 }
        var Y = Matrix(rows: 4, cols: 4, values: values)
        XCTAssertEqual(Y.values, values )
        XCTAssertEqual(Y[0,1], 1.0 )
        Y[0,1] = 42.0
        XCTAssertEqual(Y[0,1], 42.0)
        
        let r = Y.row(0)
        let c = Y.col(0)
        
        let ansR = Matrix(rows: 1, cols: 4, values: [0.0, 42.0, 2.0, 3.0])
        let ansC = Matrix(rows: 4, cols: 1, values: [0.0, 4.0, 8.0, 12.0])
       
        XCTAssertEqual(c, ansC)
        XCTAssertEqual(r, ansR)
        
        
    }


}
