//
//  dyerlab.org                                          @dyerlab
//                      _                 _       _
//                   __| |_   _  ___ _ __| | __ _| |__
//                  / _` | | | |/ _ \ '__| |/ _` | '_ \
//                 | (_| | |_| |  __/ |  | | (_| | |_) |
//                  \__,_|\__, |\___|_|  |_|\__,_|_.__/
//                        |_ _/
//
//         Making Population Genetic Software That Doesn't Suck
//
//  GeneticStudio
//  Sequence.swift
//
//  Created by Rodney Dyer on 10/27/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import Foundation

/// Override to Sequences with Hashable Items
public extension Sequence where Iterator.Element: Hashable {
    /// Returns set of unique items in sequence
    func unique() -> [Iterator.Element] {
        var seen: Set<Iterator.Element> = []
        return filter { seen.insert($0).inserted }
    }
}

/// Extension for array objects to produce a historgram dictionary
public extension Sequence where Element: Hashable {
    /// Returns an element count hash of the sequence
    func histogram() -> [Element: Int] {
        return reduce(into: [:]) { counts, elem in counts[elem, default: 0] += 1 }
    }
}
