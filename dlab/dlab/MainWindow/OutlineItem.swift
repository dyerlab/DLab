//
//  OutlineItem.swift
//  DLab
//
//  Created by Rodney Dyer on 4/29/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation



class OutlineItem: NSObject {
    
    let name: String
    let dataLabel: String
    
    init(name: String, dataLabel: String = "") {
        self.name = name
        self.dataLabel = dataLabel.count > 0 ? dataLabel : name
    }
    
}
