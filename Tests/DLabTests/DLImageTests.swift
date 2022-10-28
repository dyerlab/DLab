//
//  DLImageTests.swift
//  
//
//  Created by Rodney Dyer on 10/28/22.
//

@testable import DLab

import XCTest

final class DLImageTests: XCTestCase {



    func testExample() throws {
        
        #if os( OSX )
        guard let path = Bundle.module.path(forResource: "dyer", ofType: "jpeg"),
              let image = NSImage(contentsOfFile: path ) else {
            print("Could not load path for resrource 'dyer.jpeg'")
            return
        }
        
        print("loaded NSImage of size: \(image.size)")
        XCTAssertNotNil( image )
        #elseif os( iOS ) || os(tvOS) || os(watchOS)
        guard let path = Bundle.module.path(forResource: "tree", ofType: "png"),
              let image = UIImage(contentsOfFile: path ) else {
            print("Could not load path for resrource 'tree.png'")
            return
        }
        
        print("loaded UIImage of size: \(image.size)")
        XCTAssertNotNil( image )
        
        #endif
        
        
    }



}
