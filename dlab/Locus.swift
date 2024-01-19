//
//  Locus.swift
//  dlab
//
//  Created by Rodney Dyer on 1/19/24.
//

import Foundation
import SwiftData


@Model
class Locus: Identifiable {
    let id: UUID
    
    var name: String = ""
    var parameters: [String:Double] = [:]
    var raw: String = ""
    
    init(name: String, raw: String) {
        self.id = UUID()
        self.name = name
        self.raw = raw
    }

}
