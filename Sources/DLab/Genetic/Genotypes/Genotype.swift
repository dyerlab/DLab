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
    
    /// By default
    public var masking: AlleleMasking = .NoMasking
    
    /// Determines if the genotype is empty
    public var isEmpty: Bool {
        return left.isEmpty && right.isEmpty
    }
    
    /// Heterozygosity state, must be diploid and alleles are not empty.
    public var isHeterozygote: Bool {
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
            if masking == .NoMasking || masking == .Undefined {
                return String("\(left):\(right)")
            }
            else if masking == .MotherLeft {
                return right
            }
            else if masking == .MotherRight {
                return left 
            }
            else {
                return "XXX"
            }

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
    
    ///  Alleles as array
    public init( alleles:(String,String) ) {
        
        if alleles.0 < alleles.1 {
            self.left = alleles.0
            self.right = alleles.1
        }
        else {
            self.left = alleles.1
            self.right = alleles.0
        }
    }
    
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
        let rawAlleles = raw.components(separatedBy: ":").filter{ !$0.isEmpty }.sorted(by: { $0.compare($1, options: .numeric) == .orderedAscending })
        
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
        
        // Reset any masking when we reset the allels
        self.masking = .NoMasking
    }
    
    public mutating func setMasking( parent: Genotype ) {
        if self.isEmpty || parent.isEmpty {
            self.masking = .MissingData
        }
        else if self == parent {
            if isHeterozygote {
                masking = .Undefined
            }
            else {
                masking = .MotherLeft
            }
        }
        else if parent.left == right || parent.right == right {
            masking = .MotherRight
        }
        else if parent.left == left || parent.right == left {
            masking = .MotherLeft
        }
        else {
            masking = .Undefined
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





// MARK:  - Operators

extension Genotype {

    /**
     Random mating of two genotypes.  Both must be diploid
     - Parameters:
      - parent1: First genotype
      - parent2: Second genotype
     - Returns: Random offspring genotype.
     */
    static public func +(parent1: Genotype, parent2: Genotype) -> Genotype {
        if parent1.ploidy != .Diploid || parent2.ploidy != .Diploid {
            return Genotype()
        }

        let left = Bool.random() == true ? parent1.left : parent1.right
        let right = Bool.random() == true ? parent2.left : parent2.right
        
        return Genotype(alleles: (left,right) )
    }
    
    
}





extension Genotype {
    
    static func DefaultNULL() -> Genotype {
        return Genotype()
    }
    
    static func DefaultHaploid() -> Genotype {
        return Genotype(raw: "A")
    }
    
    static func DefaultHeterozygote() -> Genotype {
        return Genotype(alleles: ("A","B") )
    }
    
    static func DefaultHomozygote() -> Genotype {
        return Genotype(alleles: ("A","A") )
    }
    
    static func DefaultHeterozygoteMomLeft() -> Genotype {
        var geno = Genotype(raw: "A:B")
        geno.masking = .MotherLeft
        return geno
    }

    static func DefaultHeterozygoteMomRight() -> Genotype {
        var geno = Genotype(raw: "A:B")
        geno.masking = .MotherRight
        return geno
    }

    static func DefaultHeterozygoteUndefined() -> Genotype {
        var geno = Genotype(raw: "A:B")
        geno.masking = .Undefined
        return geno
    }

    
}