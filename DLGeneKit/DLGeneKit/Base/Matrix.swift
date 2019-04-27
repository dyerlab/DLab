//
//  Matrix.swift
//  DLGeneKit
//
//  Created by Rodney Dyer on 4/27/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation




struct Matrix {
    let rows: UInt
    let cols: UInt
    var values: [Double]
    var rownames: [String]?
    var colnames: [String]?
    
    
    init(rows: UInt, cols: UInt ) {
        self.rows = rows
        self.cols = cols
        self.values = Array(repeating: 0.0, count: Int(rows*cols) )
    }
    
    init( rows: UInt, cols: UInt, values: [Double]) {
        assert( rows*cols == UInt( values.count ) )
        self.rows = rows
        self.cols = cols
        self.values = values
    }
    
    subscript(i: UInt, j: UInt) -> Double {
        get {
            assert( i >= 0 && i < rows && j >= 0 && j < cols)
            return values[ Int( i*self.cols + j)]
        }
        set {
            assert( i >= 0 && i < rows && j >= 0 && j < cols)
            values[ Int( i*self.cols + j)] = newValue
        }
    }

}


// MARK: Accessors
extension Matrix {
    
    func row(_ i: UInt ) -> Matrix {
        var ret = Matrix(rows: 1, cols: self.cols)
        for j in 0 ..< self.cols {
            ret[0,j] = self[i,j]
        }
        ret.colnames = self.colnames
        ret.rownames = [ self.rownames?[Int(i)] ] as? [String]
       
        return ret
    }
    
    func col(_ j: UInt) -> Matrix {
        var ret = Matrix(rows: self.rows, cols: 1 )
        for i in 0 ..< self.rows {
            ret[i,0] = self[i,j]
        }
        ret.rownames = self.rownames
        ret.colnames = [ self.colnames?[Int(j)] ] as? [String]
        return ret
    }
    
    
}


// MARK: Matrix Operators
extension Matrix : CustomStringConvertible {
    
    public var description: String {
        get {
            var ret = "Matrix: (\(self.rows) x \(self.cols))\n"
            
            if self.colnames != nil {
                ret += ","
                ret += self.colnames!.joined(separator: ",")
                ret += "\n"
            }
            
            for i in 0 ..< self.rows {
                var row = [String]()
                if self.rownames != nil {
                    row.append( self.rownames![Int(i)])
                }
                
                for j in 0 ..< self.cols {
                    row.append("\(self[i,j])")
                }
                
                ret += row.joined(separator: ",")
                ret += "\n"
            }
            return ret
        }
    }
    
    
    
}

extension Matrix : Equatable {
    
    static func == (lhs: Matrix, rhs: Matrix) -> Bool {
        return lhs.values == rhs.values &&
                lhs.colnames == rhs.colnames &&
                lhs.rownames == rhs.rownames
    }
    
}

