//
//  SwiftUIView.swift
//  
//
//  Created by Rodney Dyer on 6/7/22.
//

import MapKit
import SwiftUI

struct StratumMap: View {
    
    @State var region: MKCoordinateRegion
    let locations: [Location]
    
    var body: some View {
        ZStack(content: {
            
            Map(coordinateRegion: $region, interactionModes: .all, annotationItems: locations) { location in
                MapMarker(coordinate: location.coordinate )
            }
            HStack {
                Spacer()
                VStack{
                    Spacer()
                    Text(String("\(locations.count) items"))
                }

            }

        })
    }
}

struct StratumMap_Previews: PreviewProvider {
    static var previews: some View {
        StratumMap( region: Stratum.DefaultStratum().region,
                    locations: Stratum.DefaultStratum().locations )
    }
}
