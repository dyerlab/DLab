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
//
//  AlleleFrequencies.swift
//
//
//  Created by Rodney Dyer on 5/9/22.
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <https://www.gnu.org/licenses/>.

import Foundation

public struct AlleleFrequencies: Codable {
    public var locus: String = ""
    public var genotypes = [String:Double]()
    private var counts = [String: Double]()
    private var N = 0.0

    public var numHets = 0.0
    public var numDiploid = 0.0
    public var alleles: [String] {
        get {
            return counts.keys.sorted { $0.localizedStandardCompare($1) == .orderedAscending }
        }
        set {
            for toAdd in Set(newValue).subtracting(counts.keys) {
                counts[toAdd] = 0.0
            }
        }
    }
    
    public var isEmpty: Bool {
        return self.N == 0 
    }

    public init() {}
    
    public init( freqs: [AlleleFrequencies] ) {
        self.locus = "All"
        for freq in freqs {
            self.N = self.N + freq.N
            self.numHets = self.numHets + freq.numHets
            self.numDiploid = self.numDiploid + freq.numDiploid
            for allele in freq.alleles {
                self.counts[ allele ] = self.counts[ allele, default: 0.0 ] + freq.counts[ allele, default: 0.0 ]
            }
            for geno in freq.genotypes.keys {
                self.genotypes[ geno ] = self.genotypes[ geno, default: 0.0] + freq.genotypes[ geno, default: 0.0]
            }
        }
    }

    public init(genotypes: [Genotype]) {
        for geno in genotypes {
            addGenotype(geno: geno)
        }
    }

    public mutating func addGenotypes(genos: [Genotype]) {
        genos.forEach { geno in
            self.addGenotype(geno: geno)
        }
    }

    public mutating func addGenotype(geno: Genotype) {
        
        if !geno.isEmpty && geno.ploidy == .Diploid {
            self.genotypes[ geno.description ] = self.genotypes[ geno.description, default: 0.0] + 1
        }
        
        
        if geno.ploidy == .Diploid, geno.masking == .NoMasking || geno.masking == .Undefined {
            numDiploid += 1.0
            if geno.isHeterozygote {
                numHets += 1.0
            }
            if !geno.left.isEmpty {
                N += 1.0
                counts[geno.left, default: 0.0] += 1.0
            }
            if !geno.right.isEmpty {
                N += 1.0
                counts[geno.right, default: 0.0] += 1.0
            }
            return
        } else if geno.masking != .NoMasking {
            // either not diploid or masked
            if geno.masking != .MotherLeft && !geno.left.isEmpty {
                N += 1.0
                counts[geno.left, default: 0.0] += 1.0
            }
            if geno.masking != .MotherRight && !geno.right.isEmpty {
                N += 1.0
                counts[geno.right, default: 0.0] += 1.0
            }
        }
    }

    public func frequency(allele: String) -> Double {
        if N == 0.0 {
            return 0.0
        } else {
            return counts[allele, default: 0.0] / N
        }
    }

    public func frequencies(alleles: [String]) -> Vector {
        var ret = Vector(repeating: 0.0, count: alleles.count)
        for i in 0 ..< alleles.count {
            ret[i] = frequency(allele: alleles[i])
        }
        return ret
    }
}

extension AlleleFrequencies: CustomStringConvertible {
    public var description: String {
        var ret = "Frequencies:\n"
        for allele in alleles {
            ret += String(" \(allele): \(frequency(allele: allele))\n")
        }
        ret += String("Counts: \(counts)\n")
        ret += String("N: \(N)\n")
        ret += String("nHets: \(numHets)\n")
        ret += String("nDip: \(numDiploid)\n")
        
        ret += String("Genotypes:\n")
        for key in self.genotypes.keys.sorted() {
            ret += String(" \(key): \(self.genotypes[key, default: 0.0])\n")
        }
        return ret
    }
}

public extension AlleleFrequencies {
    static func Default() -> AlleleFrequencies {
        let data = Stratum.DefaultStratum()
        let locus = data.individuals.locusKeys.first!
        print("\(locus)")
        let genos = data.individuals.getGenotypes(named: locus)
        let freqs = AlleleFrequencies(genotypes: genos)
        return freqs
    }
}


extension AlleleFrequencies: MatrixConvertible {
    
    public func asMatrix() -> Matrix {
        let theAlleles = self.alleles
        let ret = Matrix( 1, theAlleles.count )
        
        ret.colNames = theAlleles
        ret.rowNames = ["All"]
        for i in 0 ..< theAlleles.count {
            ret[0,i] = frequency(allele: theAlleles[i] )
        }
        return ret
    }
    
}

