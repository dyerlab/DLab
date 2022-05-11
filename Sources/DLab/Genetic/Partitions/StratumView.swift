//
//  SwiftUIView.swift
//  
//
//  Created by Rodney Dyer on 5/11/22.
//

import SwiftUI

struct SwiftUIView: View {
    
    @Binding var data: Stratum
    
    
    var body: some View {
        ScrollView( [.horizontal, .vertical] ) {
            LazyVGrid(columns: self.getColumns(), content: {
                
                ForEach( data.individuals.strataKeys, id: \.self) { key in
                    
                    // header
                    Text("\(key)")
                        .bold()
                    
                    // Stuff
                    ForEach( data.individuals.strataLevels(stratum: key), id: \.self) { value in
                        Text("\(value)")
                            .foregroundColor(.red)
                    }
                }
                
                
                
            })
            
        }
    }
    
    private func getColumns() -> [GridItem] {
        let keys = data.individuals.allKeys
        return Array(repeating: GridItem(.fixed(100)), count: keys.count )
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView( data: .constant( Stratum.DefaultStratum() ) )
    }
}
