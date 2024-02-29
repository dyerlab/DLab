//
//  Stratum.swift
//  DLab
//
//  Created by Rodney Dyer on 2024-02-29.
//

import SwiftData
import Foundation

@Model
class Stratum {
    
    let name: String
    let levels: [String]
    
    init(name: String, levels: [String]) {
        self.name = name
        self.levels = levels
    }
    
    
    
}
