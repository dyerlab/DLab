//
//  File.swift
//
//
//  Created by Rodney Dyer on 5/9/22.
//

import Foundation
import MapKit

public extension MKCoordinateRegion {
    /// Buffer me
    func buffered(scale: CGFloat) -> MKCoordinateRegion {
        var span = self.span
        span.latitudeDelta = span.latitudeDelta * scale
        span.longitudeDelta = span.longitudeDelta * scale
        return MKCoordinateRegion(center: center, span: span)
    }
}
