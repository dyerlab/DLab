//
//  DataProvider.swift
//  DLGeneKit
//
//  Created by Rodney Dyer on 4/28/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation


protocol DataProvider {
    
    func getData(key: String, idx: Int) -> String
    func setData(key: String, idx: Int, value: String )
    
}
