//
//  CLLocationCoordinate2D.swift
//  DLGeneKit
//
//  Created by Rodney Dyer on 4/27/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation
import MapKit

extension CLLocationCoordinate2D  {
    
    init(_ coord: Coordinate ) {
        self.init(latitude: coord.latitude, longitude: coord.longitude)
    }

}
