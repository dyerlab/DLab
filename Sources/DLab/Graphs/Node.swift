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
//  Node.swift
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

struct Node: Codable {
    let id: UUID
    var label: String
    var size: Double
    var edges: [Edge]
    var coordinate: Vector

    enum CodingKeys: String, CodingKey {
        case id
        case label
        case size
        case edges
        case coordinate
    }

    init(label: String, size: Double, coord: [Double]) {
        id = UUID()
        self.label = label
        self.size = size
        coordinate = coord
        edges = [Edge]()
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(UUID.self, forKey: .id)
        label = try values.decode(String.self, forKey: .label)
        size = try values.decode(Double.self, forKey: .size)
        edges = try values.decode(Array.self, forKey: .edges)
        coordinate = try values.decode(Vector.self, forKey: .coordinate)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(label, forKey: .label)
        try container.encode(size, forKey: .size)
        try container.encode(edges, forKey: .edges)
        try container.encode(coordinate, forKey: .coordinate)
    }
}

extension Node: Equatable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        return String("\(label): \(size) ( \(coordinate) )")
    }
}
