//
//  Stratum.swift
//  DLGeneKit
//
//  Created by Rodney Dyer on 4/26/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation

class DataSet {
    var loci: [String:Locus]
    var individual: [Individual]
    
    init() {
        loci = [String:Locus]()
        individual = [Individual]()
    }
}
