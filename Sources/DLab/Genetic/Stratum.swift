//
//  File.swift
//  
//
//  Created by Rodney Dyer on 5/9/22.
//

import Foundation

public class Stratum: Codable {
    
    public var id: UUID = UUID()
    
    public var individuals: [Individual] = []
    
    public var count: Int {
        return self.individuals.count
    }
    
    public var header: [String] {
        var ret = [String]()
        if !individuals.isEmpty,
           let ind = individuals.first {
            ret.append(contentsOf: ind.strata.keys.sorted(by: { $0.compare($1, options: .numeric) == .orderedAscending }) )
            if ind.coord != nil { 
                ret.append(contentsOf: ind.coord!.keys)
            }
            ret.append(contentsOf: ind.loci.keys.sorted(by: { $0.compare($1, options: .numeric) == .orderedAscending }) )
        }
        return [String]()
    }
    
    public init() { }
    
    
    
}
