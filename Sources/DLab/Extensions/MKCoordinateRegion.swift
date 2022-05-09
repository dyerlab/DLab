//
//  File.swift
//  
//
//  Created by Rodney Dyer on 5/9/22.
//

import Foundation
import MapKit



extension MKCoordinateRegion {
    
    /// Buffer me 
    public func buffered( scale: CGFloat ) -> MKCoordinateRegion {
        var span = self.span
        span.latitudeDelta = span.latitudeDelta * scale
        span.longitudeDelta = span.longitudeDelta * scale
        return MKCoordinateRegion(center: self.center, span: span)
    }
    
    
}

