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
        VStack{
            ScrollView( [.horizontal, .vertical] ) {
                Grid {
                    
                    GridRow {
                        Text("Stratum")
                            .bold()
                        Text("N")
                            .bold()
                        Text("A")
                            .bold()
                        Text("A95")
                            .bold()
                        Text("Ae")
                            .bold()
                        Text("Ho")
                            .bold()
                        Text("He")
                            .bold()
                        Text("F")
                            .bold()
                    }
                    
                    ForEach( 0 ..< diversity.count, id: \.self) { row in
                        GridRow {
                            Text("\(diversity[row].stratum)")
                            Text( String(format: "%d", diversity[row].N))
                            Text( String(format: "%d", diversity[row].A) )
                            Text( String(format: "%d", diversity[row].A95) )
                            Text( String(format: "%.3f", diversity[row].Ae) )
                            Text( String(format: "%.3f", diversity[row].Ho) )
                            Text( String(format: "%.3f", diversity[row].He) )
                            Text( String(format: "%.3f", diversity[row].F) )
                        }
                    }
                    
                }
            }
            Spacer()
        }
    }
}

struct DiversityTableView_Previews: PreviewProvider {
    static var previews: some View {
        DiversityTableView( diversity:  DataStore.Default().diversityFor(locus: "MP20") )
        DiversityTableView( diversity:  [DataStore.Default().frequenciesFor(locus: "MP20").totalGeneticDiversity()] )
    }
}
