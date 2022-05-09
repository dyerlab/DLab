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
//  Individual.swift
//
//  Created by Rodney Dyer on 10/27/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//


import Foundation

public class Individual: Codable  {
    
    public var id: UUID
    public var coord: Coordinate?
    public var loci: [String:Genotype]
    public var strata: [String:String]
    
    
    /// Default initiatiator
    public init() {
        self.id = UUID()
        self.loci = [String:Genotype]()
        self.strata = [String:String]()
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case coord
        case strata
        case loci
    }
    
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode( UUID.self, forKey: .id )
        coord = try values.decode( Coordinate.self, forKey: .coord )
        strata = try values.decode( Dictionary.self, forKey: .strata )
        loci = try values.decode( Dictionary.self, forKey: .loci )
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode( id, forKey: .id )
        try container.encode( coord, forKey: .coord )
        try container.encode( strata, forKey: .strata )
        try container.encode( loci, forKey: .loci )
    }

    
    
}













extension Individual: CustomStringConvertible {
    
    /// Overload of description for plotting
    public var description: String {
    
        var ret = [String("\(id.description)")]
        
        for key in strata.keys.sorted(by: { $0.compare($1, options: .numeric) == .orderedAscending }) {
            ret.append( strata[key]! )
        }
        if let coord = self.coord {
            ret.append( String("\(coord.longitude)"))
            ret.append( String("\(coord.latitude)"))
            if coord.hasElevation {
                ret.append( String("\(coord.elevation)"))
            }
        }
        
        for key in loci.keys.sorted(by: { $0.compare($1, options: .numeric) == .orderedAscending }) {
            ret.append( String("\(loci[key]!)" ) )
        }
        
        return ret.joined(separator: ", ")
    }
}












