//
//  dyerlab.org                                          @dyerlab
//                      _                 _       _
//                   __| |_   _  ___ _ __| | __ _| |__
//                  / _` | | | |/ _ \ '__| |/ _` | '_ \
//                 | (_| | |_| |  __/ |  | | (_| | |_) |
//                  \__,_|\__, |\___|_|  |_|\__,_|_.__/
//                        |_ _/
//
//         Making Population Genetic Software That Doesn't Suck
//
//  GeneticStudio
//  Genotype.swift
//
//  Created by Rodney Dyer on 05/09/22.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import Foundation

public struct Genotype: Codable, Equatable, CustomStringConvertible {
    
    /// Keeping the alleles as a diploid set of strings.
    public var left: String = ""
    public var right: String = ""
    
    /// Heterozygosity state, must be diploid and alleles are not empty.
    public var heterozygote: Bool {
        return self.ploidy == .Diploid && left != right
    }

    /// Description of the genotype
    public var description: String {
        switch self.ploidy {
        case .Missing:
            return "-"
        case .Haploid:
            return String("\(left)\(right)")
        default:
            return String("\(left):\(right)")
        }
    }
        
    /// Ploidy of the current Genotype
    public var ploidy: Ploidy {
        if left.isEmpty && right.isEmpty {
            return .Missing
        }
        else if left.isEmpty || right.isEmpty  {
            return .Haploid
        }
        else {
            return .Diploid
        }
    }
    
    /// Default initializer
    public init() { }
    
    /// Initializing from string. Alleles separated by ":"
    public init(raw: String) {
        self.setAlleles(raw: raw)
    }
    
    /// Equatable means that all alleles are identical
    public static func ==(lhs: Genotype, rhs: Genotype) -> Bool {
        return lhs.left == rhs.left && lhs.right == rhs.right
    }
    
    /// Sets alleles from raw data with 0 or more alleles separated by colon.
    public mutating func setAlleles( raw: String ) {
        let rawAlleles = raw.components(separatedBy: ":").sorted().filter{ !$0.isEmpty }
        
        if rawAlleles.count == 1 {
            left = rawAlleles[0]
            right = ""
        }
        else if rawAlleles.count == 2 {
            left = rawAlleles[0]
            right = rawAlleles[1]
        }
        else {
            left = ""
            right = ""
        }
    }
 
    
    /// Convert locus to a vector with specific alleles.
    /// - Parameters:
    ///     - alleles: A vector of string objects for all alleles
    /// - Returns: A vector with each allele in the genotype indicated by 1.0.  Returned vector sam length as passed alleles.
    public func asVector( alleles: [String] ) -> Vector {
        var ret = Vector(repeating: 0.0, count: alleles.count )
        if !left.isEmpty,
           let idx = alleles.firstIndex(where: {$0 == left} ) {
            ret[idx] = ret[idx] + 1.0
        }
        if !right.isEmpty,
           let idx = alleles.firstIndex(where: {$0 == right} ) {
            ret[idx] = ret[idx] + 1.0
        }
        return ret
    }
}
