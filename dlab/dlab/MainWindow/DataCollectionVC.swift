//
//  DataCollectionVC.swift
//  DLab
//
//  Created by Rodney Dyer on 4/29/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa

class DataCollectionVC: NSViewController {

    @IBOutlet weak var collectionView: NSCollectionView!
    @IBOutlet weak var mainLabel: NSTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        
        configureLayout()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.sourceviewSelectionDidChange(notification:)),
                                               name: NSOutlineView.selectionDidChangeNotification,
                                               object: nil)
    }
    
    
    
    @objc private func sourceviewSelectionDidChange(notification: NSNotification) {
        
        let selectedIndex = (notification.object as! NSOutlineView).selectedRow
        let object: Any? = (notification.object as! NSOutlineView).item(atRow: selectedIndex)
        if (object is OutlineItem ) {
            
            mainLabel.stringValue = (object as! OutlineItem).dataLabel
            
            
        }
        
        
    }
    
    
    
    fileprivate func configureLayout() {
        
        let flowLayout = NSCollectionViewFlowLayout()
        flowLayout.itemSize = NSSize(width: 400.0, height: 250.0)
        flowLayout.sectionInset = NSEdgeInsets(top: 10.0, left: 20.0, bottom: 10.0, right: 20.0)
        flowLayout.minimumInteritemSpacing = 20.0
        flowLayout.minimumLineSpacing = 20.0
        collectionView.collectionViewLayout = flowLayout
        view.wantsLayer = true
        collectionView.layer?.backgroundColor = NSColor.black.cgColor
        
        print("DataCollectionVC::configureLayout")
        
    }
    
}
