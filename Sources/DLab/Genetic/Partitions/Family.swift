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
                offspring.loci[ locus ]?.masking = getMask( offspring: offspring.loci[locus, default: Genotype()],
                                                            parent: mom.loci[locus, default: Genotype() ])
            }
            self.addIndividual(ind: offspring)
        }
    }
    
    
    
    
    private func getMask(offspring: Genotype, parent: Genotype ) -> AlleleMasking {
        
        if offspring.isEmpty || parent.isEmpty { return .NoMasking }
        
        if offspring == parent && offspring.isHeterozygote { return .UNDEFINED }
        
        if parent.left == offspring.right || parent.right == offspring.right {
            return .MotherRight
        }
        else if parent.left == offspring.left || parent.right == offspring.left {
            return .MotherLeft
        }
        else {
            return .UNDEFINED
        }
        
    }
    
    
}
