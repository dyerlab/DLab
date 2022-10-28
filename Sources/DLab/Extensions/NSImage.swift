//
//  NSImage.swift
//  
//
//  Created by Rodney Dyer on 10/28/22.
//

import Foundation

#if os(OSX)
import Cocoa


extension NSImage {
    
    var cgImage: CGImage? {
        var proposedRect = CGRect(origin: .zero, size: size )
        return cgImage(forProposedRect: &proposedRect,
                       context: nil,
                       hints: nil)
    }
}

#endif
