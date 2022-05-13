//
//  File.swift
//
//
//  Created by Rodney Dyer on 5/9/22.
//

import CoreLocation
import Foundation

extension CLLocationCoordinate2D {
    /// Override convience intiializer from coordinate
    init(coordinate: Coordinate) {
        self.init()
        longitude = coordinate.longitude ?? 0.0
        latitude = coordinate.latitude ?? 0.0
    }
}

extension CLLocationCoordinate2D: Equatable {
    /// Public determination of equality of two coordinates
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}
