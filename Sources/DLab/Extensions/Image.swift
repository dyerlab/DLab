//
//  File.swift
//  
//
//  Created by Rodney Dyer on 10/28/22.
//

import Foundation
import SwiftUI

extension Image {
    
    init(_ dlImage: DLImage) {
        #if os(iOS) || os(watchOS)  || os(tvOS)
        self.init( uiImage: dlImage)
        #elseif os( OSX )
        self.init( nsImage: dlImage)
        #endif
    }
    
    init( packageResource name: String, ofType type: String) {
        
        #if os(iOS) || os(tvOS) || os(watchOS)
        guard let path = Bundle.module.path(forResource: name, ofType: type),
              let image = UIImage(contentsOfFile: path) else {
            self.init(name)
            return
        }
        self.init( uiImage: image)
        #elseif os( OSX )
        guard let path = Bundle.module.path(forResource: name, ofType: type),
              let image = NSImage(contentsOfFile: path ) else {
            self.init(name)
            return
        }
        self.init( nsImage: image)
        #else
        self.init( name )
        #endif
        
    }
}
