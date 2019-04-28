//
//  Array.swift
//  DLab
//
//  Created by Rodney Dyer on 4/28/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation

extension Array {
    
    public func randomElement()  -> Element? {
        if isEmpty { return nil }
        let idx = Int(arc4random_uniform(UInt32(self.count)))
        return self[idx]
    }
    
}
