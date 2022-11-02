//
//  File.swift
//  
//
//  Created by Rodney Dyer on 11/2/22.
//

import Foundation



extension Set where Element == Node {
    
    var centroid: Vector? {
        let ret = Array( self.compactMap { $0.coord} )
        return ret.centoid
    }
        
}
