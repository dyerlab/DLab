//
//  File.swift
//  
//
//  Created by Rodney Dyer on 10/29/22.
//

import Foundation

public struct DataColumns {
    let header: [String]?
    var strata: [Int]
    let latitude: Int?
    let longitude: Int?
    var loci: [Int]
    
    init( raw: [[String]] ) {
        assert( raw.count > 0 )
        self.header = raw.first
        self.strata = [Int]()
        self.loci = [Int]()
        
        var colsToCheck: [Int] = Array( 0..<header!.count )
        
        if let latCol = header?.firstIndex(of: "Longitude"),
           let lonCol = header?.firstIndex(of: "Latitude") {
            latitude = latCol
            longitude = lonCol
            colsToCheck = colsToCheck.filter { $0 == latitude }
            colsToCheck = colsToCheck.filter { $0 == longitude }
        } else {
            self.latitude = nil
            self.longitude = nil
        }
        
        for col in colsToCheck {
            for i in 1 ..< raw.count {
                let val = raw[i][col]
                let locus = val.contains(where: {$0 == ":"} )
                if locus == true  {
                    loci.append( col )
                    break
                }
            }
            strata.append( col )
        }
    }
}
