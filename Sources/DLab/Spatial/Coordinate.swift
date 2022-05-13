//
//  File.swift
//  
//
//  Created by Rodney Dyer on 5/9/22.
//

import Foundation
import CoreLocation


/*
 The generic location structure.
 */
public struct Coordinate: Codable, CustomStringConvertible {

    /// The coordiante in the y-axis
    public var longitude: Double?
    
    /// The coordinate in the x-axis
    public var latitude: Double?
    

    
    /// Empty coordinate has no lat/lon
    public var isEmpty: Bool {
        return latitude == longitude && latitude == nil
    }
    
    /// Overload of string convertible
    public var description: String {
        if let lat = latitude,
           let lon = longitude {
            return String("\(lon), \(lat)")
        } else {
            return String("- , -")
        }
    }
    
    /// Keys to location
    public var keys: [String] {
        return ["Longitude","Latitude"]
    }
    
}




