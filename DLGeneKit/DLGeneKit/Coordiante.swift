//
//  Coordiante.swift
//  DLGeneKit
//
//  Created by Rodney Dyer on 4/27/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation
import MapKit

struct Coordinate: Codable {
    var longitude: Double
    var latitude: Double
    var isValid: Bool {
        return abs(latitude) <= 90 && abs(longitude) <= 180
    }
    
    init() {
        latitude = 91
        longitude = 181
    }
    
    init( lat: Double, lon: Double) {
        self.latitude = lat
        self.longitude = lon
    }
    
    init(_ coord: CLLocationCoordinate2D) {
        self.longitude = coord.longitude
        self.latitude = coord.latitude
    }
}

extension Coordinate: Equatable {
    
    static func == (lhs: Coordinate, rhs: Coordinate) -> Bool {
        return lhs.longitude == rhs.longitude && lhs.latitude == rhs.longitude
    }
    
}

