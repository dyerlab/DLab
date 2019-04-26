//
//  Gene.swift
//  DLGeneKit
//
//  Created by Rodney Dyer on 4/26/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation

class Genotype : Codable {
    var alleles: [String]

    var ploidy: Int  {
        get { return alleles.count }
    }
    var isMissing: Bool {
        get { return alleles.count == 0}
    }
    
    var isHeterozygote: Bool {
        get { return Set(alleles).count > 1 }
    }
    
    subscript(i :Int) -> String {
        assert(i < alleles.count)
        return alleles[i]
    }
    
    init() {
        alleles = [String]()
    }
    
    init(_ val: String) {
        if val.contains(":") {
            alleles = val.components(separatedBy: ":").sorted()
        } else {
            alleles = [val]
        }
    }
    
    init(_ vals: [String]) {
        alleles = vals.sorted()
    }
}


// MARK: Inteactions with the object
extension Genotype {
    
    func vector( vals: [String] ) -> [Double] {
        let n = vals.count
        var ret = Array(repeating: 0.0, count: n)
        for allele in self.alleles {
            if let idx = vals.firstIndex(of: allele) {
                ret[idx] += 1.0
            }
        }
        return ret
    }
}




extension Genotype: CustomStringConvertible {
    var description: String {
        get {
            return alleles.joined(separator: ":")
        }
    }
}


extension Genotype: Equatable {
    static func == (lhs: Genotype, rhs: Genotype) -> Bool {
        return( lhs.alleles == rhs.alleles )
    }
}
