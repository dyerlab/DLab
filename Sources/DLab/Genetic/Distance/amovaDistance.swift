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
//  AMOVADistance.swift
//
//  Created by Rodney Dyer on 10/27/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import Foundation

/// Estimates distance between two genotypes (uses vector ``amovaDistance(_:_:)`` after vector transformation.
/// - Parameters:
///   - geno1: The first genotype
///   - geno2: The second genotype
/// - Returns: The distance between the two genotypes
public func amovaDistance(geno1: Genotype, geno2: Genotype) -> Double {
    if geno1.isEmpty || geno2.isEmpty || geno1 == geno2 {
        return 0.0
    }

    let allAlleles: [String] = Set<String>([geno1.left, geno2.left, geno1.right, geno2.right]).unique()
    let x = geno1.asVector(alleles: allAlleles)
    let y = geno2.asVector(alleles: allAlleles)
    return amovaDistance(x, y)
}

/// Estimates distance between two vectors
/// - Parameters:
///   - vec1: The first vector
///   - vec2: The second vector
/// - Returns: The distance between them
public func amovaDistance(_ vec1: Vector, _ vec2: Vector) -> Double {
    return ((vec1 - vec2).map { $0 * $0 }).sum / 2.0
}
