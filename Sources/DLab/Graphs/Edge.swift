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
//  Edge.swift
//
//
//  Created by Rodney Dyer on 5/6/22.
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <https://www.gnu.org/licenses/>.

import Foundation

struct Edge: Codable {
    var node: Node
    var weight: Double

    init(node: Node, weight: Double) {
        self.node = node
        self.weight = weight
    }
}

extension Edge: Equatable {
    static func == (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.node == rhs.node && lhs.weight == rhs.weight
    }
}

extension Edge: CustomStringConvertible {
    var description: String {
        return String("\(node.description) \(weight)")
    }
}
