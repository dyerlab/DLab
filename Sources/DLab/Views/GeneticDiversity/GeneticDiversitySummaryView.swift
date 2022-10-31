//
//  dyerlab.org                                          @dyerlab
//                      _                 _       _
//                   __| |_   _  ___ _ __| | __ _| |__
//                  / _` | | | |/ _ \ '__| |/ _` | '_ \
//                 | (_| | |_| |  __/ |  | | (_| | |_) |
//                  \__,_|\__, |\___|_|  |_|\__,_|_.__/
//                        |_ _/
//
//         Making Population Genetic Software That Doesn't Suck
//
//
//  AllelicDiversityView.swift
//
//
//  Created by Rodney Dyer on 5/13/22.
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <https://www.gnu.org/licenses/>.

import SwiftUI

struct GeneticDiversitySummaryView: View {
    @State private var displayType: OutputDisplayType = .Tabular
    @State private var visibiltyType: StrataVisibilityType = .Strata
    let data: DataStore
    let locus: String
    
    var body: some View {
        
        VStack {
            VStack {
                Text("Genetic Diversity: \(self.locus)")
                    .font(.largeTitle)
                // header
                HStack {
                    
                    Picker("Levels:", selection: $visibiltyType) {
                        ForEach(StrataVisibilityType.allCases, id: \.self) { value in
                            Text( "\(value.rawValue)").tag( value )
                        }
                    }
                    .pickerStyle( SegmentedPickerStyle() )
                    .fixedSize()
                    
                    Spacer()
                    
                    Picker("Output:", selection: $displayType) {
                        ForEach(OutputDisplayType.allCases, id: \.self) { value in
                            Text( "\(value.rawValue)").tag( value )
                        }
                    }
                    .pickerStyle( SegmentedPickerStyle() )
                    .fixedSize()
                }
                
                switch displayType {
                case .Graphical:
                    if visibiltyType == .AllData {
                        Text("Graphical for All Data")
                            .bold()
                    } else {
                        Text("Graphical for partitioned Data")
                            .bold()
                    }
                case .Tabular:
                    if visibiltyType == .AllData {
                        DiversityTableView(diversity: [ data.frequenciesFor( locus: locus).totalGeneticDiversity()])
                    } else {
                        DiversityTableView( diversity: data.diversityFor(locus: locus) )
                    }
                }
                Spacer()
                
            }
            .padding()
            Spacer()
            Spacer()

        }
        
    }
}

struct GeneticDiversityView_Previews: PreviewProvider {
    static var previews: some View {
        GeneticDiversitySummaryView(data: DataStore.Default(),
                             locus: "LTRS")
    }
}
