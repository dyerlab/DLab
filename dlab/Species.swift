//
//  Species.swift
//  dlab
//
//  Created by Rodney Dyer on 1/19/24.
//

import Foundation
import SwiftData

@Model
class Species: Identifiable {
    let id: UUID = UUID()
    let genus: String = ""
    let species: String = ""
    
    init(genus: String, species: String) {
        self.genus = genus
        self.species = species
    }
    
}
