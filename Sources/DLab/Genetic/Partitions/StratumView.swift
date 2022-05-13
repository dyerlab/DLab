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
//  StratumView.swift
//
//
//  Created by Rodney Dyer on 5/11/22.
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

struct StatumView: View {
    @Binding var data: Stratum

    var body: some View {
        ScrollView([.horizontal, .vertical]) {
            LazyVGrid(columns: self.getColumns(), content: {
                ForEach(data.individuals.strataKeys, id: \.self) { key in

                    // header
                    Text("\(key)")
                        .bold()

                    // Stuff
                    ForEach(data.individuals.strataLevels(stratum: key), id: \.self) { value in
                        Text("\(value)")
                            .foregroundColor(.red)
                    }
                }

            })
        }
    }

    private func getColumns() -> [GridItem] {
        let keys = data.individuals.allKeys
        return Array(repeating: GridItem(.fixed(100)), count: keys.count)
    }
}

struct StatumView_Previews: PreviewProvider {
    static var previews: some View {
        StatumView(data: .constant(Stratum.DefaultStratum()))
    }
}
