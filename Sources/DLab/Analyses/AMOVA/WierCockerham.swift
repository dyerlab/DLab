//
//  File.swift
//  
//
//  Created by Rodney Dyer on 6/2/22.
//

import Foundation


public struct WierCockerham {
    
    public let D: Matrix
    let strata: [String]
    let dfT: Double
    var dfA: Double {
        let K = strata.unique().count
        return Double(K) - 1.0
    }
    var dfW: Double {
        return dfT - dfA
    }
    
    
    
    init(genotypes: [Genotype], partitions: [String]) {
        let N = genotypes.count
        strata = partitions
        dfT = Double(N) - 1.0
        
        
        D = Matrix(N, N )
        for i in 0 ..< N {
            for j in (i+1) ..< N {
                D[i,j] = amovaDistance(geno1: genotypes[i], geno2: genotypes[j])
                D[j,i] = D[i,j]
            }
        }
        
    }
    
}
