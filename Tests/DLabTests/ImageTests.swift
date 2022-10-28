//
//  DLImageTests.swift
//  
//
//  Created by Rodney Dyer on 10/28/22.
//
@testable import DLab

import XCTest
import SwiftUI

final class ImageTests: XCTestCase {

    func testExample() throws {
        let img = Image(packageResource: "tree", ofType: "png").resizable()
        XCTAssertNotNil( img )
    }
}
