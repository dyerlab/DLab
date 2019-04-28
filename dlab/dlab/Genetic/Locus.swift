//
//  Locus.swift
//  DLGeneKit
//
//  Created by Rodney Dyer on 4/26/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation

class Locus : Codable {
    
    var genotypes = [Genotype]()
    var frequencies =  Frequencies()
    var count: Int {
        get { return self.genotypes.count }
    }
    subscript(idx: Int) -> Genotype {
        get {
            assert( idx < self.count )
            return self.genotypes[idx]
        }
        set {
            assert( idx < self.count )
            frequencies.replaceLocus(old: self.genotypes[idx], new: newValue)
            self.genotypes[idx] = newValue
        }
    }
    
    func append(_ geno: Genotype ) {
        self.genotypes.append(geno)
        self.frequencies.addLocus(geno)
    }
    
}

extension Locus : Equatable {
    
    static func == (lhs: Locus, rhs: Locus) -> Bool {
        return lhs.genotypes == rhs.genotypes
    }
    
}


