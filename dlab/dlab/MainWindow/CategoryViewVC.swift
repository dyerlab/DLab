//
//  DataViewVC.swift
//  DLab
//
//  Created by Rodney Dyer on 4/28/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa

class CategoryViewVC: NSViewController {

    @IBOutlet weak var sourceListView: NSOutlineView!
    
    var categories: [OutlineCategory] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        print("DataViewVC::viewDidLoad")
        
        let summaryCategory = OutlineCategory(name: "Summary")
        let otherCategory = OutlineCategory(name: "Other")
        
        categories.append( summaryCategory )
        categories.append( otherCategory )
        summaryCategory.items.append( OutlineItem(name: "Data Overview") )
        summaryCategory.items.append( OutlineItem(name: "Other Stuff"))
        otherCategory.items.append( OutlineItem(name: "First") )
        otherCategory.items.append( OutlineItem(name: "Second") )
        
        sourceListView?.delegate = self
        sourceListView?.dataSource = self
        sourceListView?.expandItem(nil, expandChildren: true)
        

    }
}



extension CategoryViewVC: NSOutlineViewDelegate, NSOutlineViewDataSource {
    
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        if let item: Any = item {
            switch item {
            case let category as OutlineCategory:
                return category.items[index]
            default:
                return self
            }
        } else {
            return categories[index]
        }
    }
    
    
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        switch item {
        case let category as OutlineCategory:
            return category.items.count > 0 ? true : false
        default:
            return false
        }
    }
    
    
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        
        if let item: Any = item {
            switch item {
            case let category as OutlineCategory:
                return category.items.count
            default:
                return 0
            }
            
        } else {  // How many categories
            
            return self.categories.count
        }
    }
    
    
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        
        switch item {
        case let category as OutlineCategory:
            let view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "HeaderCell"), owner: self) as? NSTableCellView
            if let textField = view?.textField {
//                textField.font = NSFont.systemFont(ofSize: 38)
                textField.stringValue = category.name
            }
            return view
            
        case let item as OutlineItem:
            let view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "DataCell"), owner: self) as? NSTableCellView
            if let textField = view?.textField {
                textField.stringValue = item.name
            }
            return view
            
        default:
            return nil
        }
        
    }
    
    
    func outlineView(_ outlineView: NSOutlineView, isGroupItem item: Any) -> Bool {
        
        if (item is OutlineCategory) {
            return true
        } else {
            return false
        }
    }
    
    

    
    
    
}
