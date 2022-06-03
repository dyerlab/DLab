//
//  File.swift
//  
//
//  Created by Rodney Dyer on 6/3/22.
//

import Foundation
public class Locus {
    
    var name: String
    var genotypes: [Genotype] {
        didSet {
            if D.rows != genotypes.count {
                makeDistance()
                self.frequencies = AlleleFrequencies(genotypes: genotypes)
                self.diversity = GeneticDiversity(frequencies: frequencies)
            }
        }
    }
    var frequencies: AlleleFrequencies
    var D: Matrix
    
    var diversity: GeneticDiversity
    
    
    init( name: String, genotypes: [Genotype] ) {
        self.name = name
        self.genotypes = genotypes
        self.frequencies = AlleleFrequencies(genotypes: genotypes)
        self.diversity = GeneticDiversity(frequencies: frequencies)
        self.makeDistance()
    }
    
    
    func makeDistance() {
        let N = genotypes.count
        let D = Matrix(N,N)
        for i in 0 ..< N {
            for j in (i+1) ..< N {
                D[i,j] = amovaDistance( self.genotypes[i], self.genotypes[j])
                D[j,i] = D[i,j]
            }
        }
    }
    
    
}
