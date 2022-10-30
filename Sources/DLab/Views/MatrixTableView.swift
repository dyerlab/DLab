//
//  SwiftUIView.swift
//  
//
//  Created by Rodney Dyer on 10/30/22.
//

import SwiftUI

struct MatrixTableView: View {
    let matrix: Matrix
    
    var body: some View {
        ScrollView {
            Grid {
                GridRow {
                    Text("Hello")
                    Image(systemName: "globe")
                }
                GridRow {
                    Image(systemName: "hand.wave")
                    Text("World")
                }
            }
        }
    }
}

struct MatrixTableView_Previews: PreviewProvider {
    static var previews: some View {
        MatrixTableView(matrix: AlleleFrequencies.Default().asMatrix() )
    }
}
