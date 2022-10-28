//
//  File.swift
//  
//
//  Created by Rodney Dyer on 10/28/22.
//

import Foundation
import SwiftUI

#if os(iOS)
    import UIKit
    public typealias DLImage = UIImage
#elseif os(OSX)
    import AppKit
    public typealias DLImage = NSImage
#endif


