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
        ScrollView( [.horizontal, .vertical] ) {
            Grid {
                // column header
                if( !matrix.colNames.isEmpty ) {
                    GridRow {
                        if(!matrix.rowNames.isEmpty) {
                            Text("")
                        }
                        ForEach( 0 ..< matrix.cols, id: \.self) { col in
                            Text( matrix.colNames[col])
                                .bold()
                        }
                    }
                }
                
                // Rows
                ForEach( 0 ..< matrix.rows, id: \.self) { row in
                    GridRow {
                        // row header
                        if(!matrix.rowNames.isEmpty) {
                            Text(matrix.rowNames[row])
                                .bold()
                        }
                        
                        ForEach( 0 ..< matrix.cols, id: \.self) { col in
                            if matrix[row,col] > 0 {
                                Text( String(format: "%.4f", matrix[row,col]))
                            }
                            else {
                                Text("-")
                            }

                        }

                    }
                }
            }
            .padding(5)
        }
    }
}

struct MatrixTableView_Previews: PreviewProvider {
    static var previews: some View {
        MatrixTableView(matrix: DataStore.Default().allFrequencyMatrixFor(locus: "ATPS") )
    }
}
