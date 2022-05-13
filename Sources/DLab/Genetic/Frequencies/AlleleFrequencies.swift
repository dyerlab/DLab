//
//  File.swift
//  
//
//  Created by Rodney Dyer on 5/9/22.
//

import Foundation

public struct AlleleFrequencies: Codable {
    
    private var counts = [String: Double]()
    private var N = 0.0
    
    public var numHets = 0.0
    public var numDiploid = 0.0
    public var alleles: [String] {
        get {
            return counts.keys.sorted {$0.localizedStandardCompare($1) == .orderedAscending}
        }
        set {
            for toAdd in Set(newValue).subtracting( counts.keys ) {
                counts[toAdd] = 0.0
            }
        }
    }
    
    
    public init() {}
    
    public init( genotypes: [Genotype] ) {
        for geno in genotypes {
            self.addGenotype(geno: geno)
        }
    }
    
    mutating public func addGenotypes( genos: [Genotype]) {
        genos.forEach{ geno in
            self.addGenotype(geno: geno)
        }
    }
    
    mutating public func addGenotype( geno: Genotype ) {
        
        if geno.ploidy == .Diploid && (geno.masking == .NoMasking || geno.masking == .Undefined) {
            numDiploid  += 1.0
            if geno.isHeterozygote {
                numHets += 1.0
            }
            if !geno.left.isEmpty {
                N += 1.0
                counts[ geno.left, default: 0.0 ] += 1.0
            }
            if !geno.right.isEmpty {
                N += 1.0
                counts[ geno.right, default: 0.0 ] += 1.0
            }
            return
        }
        else if geno.masking != .NoMasking {
            // either not diploid or masked
            if geno.masking != .MotherLeft && !geno.left.isEmpty {
                N += 1.0
                counts[ geno.left, default: 0.0 ] += 1.0
            }
            if geno.masking != .MotherRight && !geno.right.isEmpty {
                N += 1.0
                counts[ geno.right, default: 0.0 ] += 1.0
            }
        }
        
        
    }
    
    
    public func frequency(allele: String) -> Double {
        if N == 0.0 {
            return 0.0
        } else {
            return counts[ allele, default: 0.0] / N
        }
    }
    
    public func frequencies( alleles: [String] ) -> Vector {
        var ret = Vector(repeating: 0.0, count: alleles.count)
        for i in 0 ..< alleles.count {
            ret[i] = frequency(allele: alleles[i] )
        }
        return ret
    }
    
}






extension AlleleFrequencies: CustomStringConvertible {
    
    public var description: String {
        var ret = "Frequencies:\n"
        for allele in self.alleles {
            ret += String(" \(allele): \(frequency(allele: allele))\n")
        }
        ret += String("\(self.counts)\n")
        return ret
    }
    
}





extension AlleleFrequencies {
    
    public static func Default() -> AlleleFrequencies {
        let data = Stratum.DefaultStratum()
        let locus = data.individuals.locusKeys.first!
        let genos = data.individuals.getGenotypes(named: locus )
        let freqs = AlleleFrequencies(genotypes: genos )
        return freqs
    }
}







