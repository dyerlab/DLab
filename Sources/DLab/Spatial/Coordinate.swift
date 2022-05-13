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
    
    /// The coordinate in the x-axis
    public var latitude: Double = Double.nan
    
    /// The coordiante in the y-axis
    public var longitude: Double = Double.nan
    
    /// The coordinate in the z-axis
    public var elevation: Double = Double.nan
    
    /// Empty coordinate has no lat/lon
    public var isEmpty: Bool {
        return longitude == .nan && latitude == .nan
    }
    
    /// Flag to show that this has elevation
    public var hasElevation: Bool {
        return !self.elevation.isNaN
    }
    
    /// Overload of string convertible
    public var description: String {
        if hasElevation {
            return String("\(longitude), \(latitude), \(elevation)")
        } else {
            return String("\(longitude), \(latitude)")
        }
    }
    
    /// Keys to location
    public var keys: [String] {
        if !hasElevation {
            return ["Longitude","Latitude"]
        } else {
            return ["Longitude","Latitude","Elevation"]
        }
    }
    
}




