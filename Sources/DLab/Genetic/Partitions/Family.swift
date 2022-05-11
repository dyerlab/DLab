//
//  File.swift
//  
//
//  Created by Rodney Dyer on 5/10/22.
//

import Foundation



class Family: Stratum {
    
    public var mother: Individual?
    
    
    init(mother: Individual) {
        super.init()
        self.mother = mother
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    public func addOffspring( offspring: Individual ) {
        if let mom = self.mother {
            for locus in offspring.loci.keys {
                if var oGeno = offspring.loci[locus],
                   let mGeno = mom.loci[locus] {
                    oGeno.setMasking(parent: mGeno)
                    offspring.loci[locus] = oGeno
                }
            }
            self.addIndividual(ind: offspring)
        }
    }
    
    
}
