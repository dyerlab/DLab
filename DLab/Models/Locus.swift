//
//  Locus.swift
//  DLab
//
//  Created by Rodney Dyer on 2024-02-29.
//

import SwiftData
import Foundation

@Model
class Locus {
    let name: String
    let contig: String
    let location: Int
    let genotypes: String
    
    init(name: String, contig: String, location: Int, genotypes: String) {
        self.name = name
        self.contig = contig
        self.location = location
        self.genotypes = genotypes
    }
}
