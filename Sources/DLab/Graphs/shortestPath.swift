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
//  shortestPath.swift
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

/*
 The Floyd Warshall method for determining the shortest path
 between all pairs of nodes.
 */
func shortestPath(A: Matrix) -> Matrix {
    let N = A.rows
    let D = Matrix(N, N)
    let gMax = A.values.sum + 1.0
    D.rowNames = A.rowNames
    D.colNames = A.colNames

    for i in 0 ..< N {
        for j in 0 ..< N {
            if i != j {
                let val = A[i, j]
                if val > 0 {
                    D[i, j] = val
                } else {
                    D[i, j] = gMax
                }
            }
        }
    }

    for k in 0 ..< N {
        for i in 0 ..< N {
            for j in 0 ..< N {
                let curDist = D[i, j]
                let newDist = D[i, k] + D[k, j]

                if newDist < gMax {
                    if curDist < gMax {
                        D[i, j] = Double.minimum(curDist, newDist)
                    } else {
                        D[i, j] = newDist
                    }
                }
            }
        }
    }

    for i in 0 ..< N {
        for j in 0 ..< N {
            if D[i, j] == gMax {
                D[i, j] = Double.infinity
            }
        }
    }
    return D
}
