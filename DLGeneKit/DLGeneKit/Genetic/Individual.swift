//
//  Strata.swift
//  DLGeneKit
//
//  Created by Rodney Dyer on 4/27/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation
import MapKit

public class Individual : Codable {
    var strata: [String:String]
    var coordinate: Coordinate
    
    init() {
        self.strata = [String:String]()
        self.coordinate = Coordinate()
    }
    
    
    func data(key: String) -> String {
        switch (key) {
        case "Longitude":
            return "\(coordinate.longitude)"
        case "Latitude":
            return "\(coordinate.latitude)"
        default:
            return strata[key] ?? ""
        }
    }
    
    func set(key: String, val: String) {
        switch (key) {
        case "Longitude":
            coordinate.longitude = Double(val)!
            break
        case "Latitude":
            coordinate.latitude = Double(val)!
            break
        default:
            strata[key] = val
            break
        }
    }
}


extension Individual : CustomStringConvertible {
    
    public var description: String {
        let keys = strata.keys.sorted()
        var ret = [String]()
        for key in keys {
            ret.append( self.strata[key]! )
        }
        if( coordinate.isValid ) {
            ret.append( "\(String(describing: coordinate.longitude))" )
            ret.append( "\(String(describing: coordinate.latitude))" )
        }
        return ret.joined(separator: ",")
    }
}
