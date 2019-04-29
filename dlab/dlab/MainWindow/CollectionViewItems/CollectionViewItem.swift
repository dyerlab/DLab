//
//  CollectionViewItem.swift
//  DLab
//
//  Created by Rodney Dyer on 4/29/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa

class CollectionViewItem: NSCollectionViewItem {

    @IBOutlet weak var mainLabel: NSTextField!
    @IBOutlet weak var mainText: NSTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.lightGray.cgColor
        
    }
    
}
