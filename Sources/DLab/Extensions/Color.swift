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
//  Color.swift
//
//  Created by Rodney Dyer on 3/24/21.
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

import SwiftUI

extension Color {
    static func getSpacedColor(index: Int, of: Int, saturation: Double = 0.5, brightness: Double = 0.95) -> Color {
        let hue = Double(index) * (1.0 / Double(of))
        return Color(hue: hue, saturation: saturation, brightness: brightness)
    }

    static func random() -> Color {
        return Color(
            red: .random(in: 0 ... 1.0),
            green: .random(in: 0 ... 1.0),
            blue: .random(in: 0 ... 1.0)
        )
    }

    static func hslColor(number: Int, of: Int) -> Color {
        return Color(hue: Double(number) / Double(of), saturation: 2.0 / 3.0, brightness: 2.0 / 3.0)
    }

    static func getColorRange(numColors: Int, saturation: Double = 1.0, brightness: Double = 1) -> [Color] {
        var ret = [Color]()
        for i in 0 ..< numColors {
            ret.append(Color.getSpacedColor(index: i, of: numColors, saturation: saturation, brightness: brightness))
        }

        return ret
    }

    static func getColorsForFrequencies(freqs: [Double]) -> [Color] {
        var ret = [Color]()
        var ctr = 0.0

        for i in 0 ..< freqs.count {
            let val = ctr + freqs[i] / 2.0
            ret.append(Color(hue: val,
                             saturation: 0.7,
                             brightness: 1.0))
            ctr += freqs[i]
        }
        return ret
    }

    static func getNColors(N: Int, saturation: Double = 0.5, brightness: Double = 0.95) -> [Color] {
        var ret = [Color]()
        for i in 0 ..< N {
            ret.append(getSpacedColor(index: i, of: N, saturation: saturation, brightness: brightness))
        }
        return ret
    }
}
