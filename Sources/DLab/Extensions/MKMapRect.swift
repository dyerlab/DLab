//
//  File.swift
//  
//
//  Created by Rodney Dyer on 5/9/22.
//

import MapKit
import Foundation


extension MKMapRect {
    
    /// New Init based upon coordinate region
    public init( region: MKCoordinateRegion ) {
        self.init()
        let a = MKMapPoint(CLLocationCoordinate2D( latitude: region.center.latitude + (region.span.latitudeDelta/2),
                                              longitude: region.center.longitude - (region.span.longitudeDelta/2)))
        let b = MKMapPoint( CLLocationCoordinate2D( latitude: region.center.latitude - (region.span.latitudeDelta/2),
                                                  longitude: region.center.longitude + (region.span.longitudeDelta/2)) )
        self.origin = MKMapPoint( x: min(a.x,b.x), y: min(a.y,b.y))
        self.size = MKMapSize( width: abs(a.x-b.x), height: abs(a.y-b.y))
    }
}
