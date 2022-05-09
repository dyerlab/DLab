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

public func amovaDistance( geno1: Genotype, geno2: Genotype ) -> Double {
    if geno1.isEmpty || geno2.isEmpty || geno1 == geno2 {
        return 0.0
    }
    
    let allAlleles: [String] = Set<String>( [geno1.left, geno2.left, geno1.right, geno2.right]).unique()
    let x = geno1.asVector(alleles: allAlleles)
    let y = geno2.asVector(alleles: allAlleles)
    return ( (x-y).map {$0 * $0}).sum / 2.0
}
