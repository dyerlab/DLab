//
//  OutlineCategory.swift
//  DLab
//
//  Created by Rodney Dyer on 4/28/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa

class OutlineCategory: NSObject {

    let name: String
    
    var items: [OutlineItem]
    
    init(name: String) {
        self.name = name
        self.items = [OutlineItem]()
    }
    
}

