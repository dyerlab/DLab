//
//  Item.swift
//  DLab
//
//  Created by Rodney Dyer on 2024-02-29.
//

import Foundation
import SwiftData

@Model
final class Project {
    var timestamp: Date
    var genus: String = ""
    var species: String = ""
    var imageData: Data? = nil
    

    init(genus: String, species: String, imageData: Data? = nil) {
        self.timestamp = .now
        self.genus = genus
        self.species = species
        self.imageData = imageData
    }
    
    
}
