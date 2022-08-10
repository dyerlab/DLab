//
//  File.swift
//  
//
//  Created by Rodney Dyer on 8/10/22.
//

import Foundation

public class Path {
    var length: Double = 0.0
    var destination: Node = Node()
    var previous: Path!
    
}



extension Path: CustomStringConvertible {
    public var description: String {
        if previous != nil {
            return String("\(previous) " )
        } else {
            return String( "\(destination.label) = \(self.length)" )
        }
    }
}
