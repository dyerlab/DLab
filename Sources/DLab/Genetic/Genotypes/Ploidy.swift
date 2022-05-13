//
//  File.swift
//
//
//  Created by Rodney Dyer on 5/9/22.
//

import Foundation

/*
 An enum to designate ploidy of a locus.
 */
public enum Ploidy: Int {
    /// No alleles
    case Missing = 0

    /// Only one allele
    case Haploid

    /// Both Alleles present
    case Diploid
}
