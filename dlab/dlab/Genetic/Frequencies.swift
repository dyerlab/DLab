//
//  Frequencies.swift
//  DLGeneKit
//
//  Created by Rodney Dyer on 4/26/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation

class Frequencies : Codable {
    
    var counts = [String:Double]()
    var nho = 0.0
    var ndip = 0.0
    var N = 0.0
    var count: Int {
        return self.counts.keys.count
    }
    var Ho : Double {
        get { return ndip > 0 ? (nho / ndip) : 0.0 }
    }
    var He : Double {
        get { return N > 0.0 ? 1.0 - self.frequencies().map({$0*$0}).reduce(0.0,+) : 0.0 }
    }
    var Fis : Double {
        get { return 1.0 - self.Ho / self.He }
    }
    var A : Double {
        get { return Double( self.count ) }
    }
    var Ae : Double {
        get {
            let p = frequencies().map({$0*$0}).reduce(0.0,+)
            return p > 0.0 ? 1.0 / p : 0.0
        }
    }
    var alleles :  [String] {
        get { return self.counts.keys.sorted() }
    }

    subscript(allele: String) -> Double {
        return frequency(allele)
    }

    
    func frequencies() -> [Double] {
        let a = self.alleles
        var ret = Array(repeating: 0.0, count: self.count)
        
        for i in 0 ..< self.count {
            ret[i] = frequency(a[i])
        }
        return ret
    }
    
    
    func frequency(_ val: String ) -> Double {
        return N > 0 ? (self.counts[val] ?? 0.0) / N : 0.0
    }
    
    func addLocus(_ val: Genotype ){
        
        if !val.isMissing {
            

            if val.ploidy > 1 {
                ndip += 1.0
                if val.isHeterozygote {
                    nho += 1.0
                }
            }
            
            N += Double( val.ploidy )
            
            for allele in val.alleles {
                if !self.counts.keys.contains(allele) {
                    self.counts[allele] = 0.0
                }
                self.counts[allele]! += 1.0
            }

        }
    }
    
    
    func replaceLocus(old: Genotype, new: Genotype ) {
        if !old.isMissing {
            if old.isHeterozygote {
                nho -= 1.0
            }
            N -= Double( old.ploidy )
            for allele in old.alleles {
                if self.counts.keys.contains(allele) {
                    self.counts[allele]! -= 1.0
                    if self.counts[allele]! == 0.0 {
                        self.counts.removeValue(forKey: allele)
                    }
                }
            }
        }
        self.addLocus(new)
    }
    
    
}
