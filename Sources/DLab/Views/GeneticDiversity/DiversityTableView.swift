//
//  SwiftUIView.swift
//  
//
//  Created by Rodney Dyer on 10/30/22.
//

import SwiftUI

struct DiversityTableView: View {
    let diversity: [GeneticDiversity]
    var body: some View {
        ForEach( diversity, id: \.self) { div in
            Text( "jhg \(div.locus)")
        }
    }
}

struct DiversityTableView_Previews: PreviewProvider {
    static var previews: some View {
        DiversityTableView( diversity:  DataStore.Default().diversityFor(locus: "ATPS"))
    }
}
