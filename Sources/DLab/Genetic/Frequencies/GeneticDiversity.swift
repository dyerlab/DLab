//
//  File.swift
//  
//
//  Created by Rodney Dyer on 5/9/22.
//

import Foundation

public struct GeneticDiversity {
    public var A: Int = 0
    public var A95: Int = 0
    public var Ae: Double = 0.0
    public var Ho: Double = 0.0
    public var He: Double = 0.0
    public var F: Double = 0.0
    
    public init() {}
    
    public init( frequencies: AlleleFrequencies ) {
        let alleles = frequencies.alleles
        let freqs = frequencies.frequencies(alleles: alleles)
        
        A = alleles.count
        A95 = freqs.filter{ $0 >= 0.05 }.count
        
        let p = frequencies.frequencies(alleles: alleles).map{ $0 * $0 }
        He = 1.0 - p.reduce(0.0, +)
        Ho = frequencies.numDiploid > 0 ? frequencies.numHets / frequencies.numDiploid : 0.0
        Ae = A > 0 ? 1.0 / (1.0 - He) : 0.0
        F = He > 0 ? 1.0 - Ho / He : 0.0
    }
}

extension GeneticDiversity: CustomStringConvertible {
    
    /// Override of description for CustomStringConvertible
    public var description: String {
        var ret = "DiversityParameters: \n"
        ret += String("A: \(A)\n")
        ret += String("A95: \(A95)\n")
        ret += String("Ae: \(Ae)\n")
        ret += String("Ho: \(Ho)\n")
        ret += String("He: \(He)\n")
        ret += String("F: \(F)\n")
        return( ret )
    }
    
}
