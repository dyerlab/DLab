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
//  Array+Individual.swift
//
//  Created by Rodney Dyer on 10/27/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import Foundation
import CoreLocation
import MapKit


/**
 Extensions for arrays  of individuals
 */

extension Array where Element == Individual {

    /**
     Names of the loci
     - Returns: An array of locus names.
     */
    public var locusKeys: [String] {
        return self.first?.loci.keys.sorted(by: { $0.compare($1, options: .numeric) == .orderedAscending }) ?? [String]()
    }
    
    /**
     Strata Keys
     - Returns: An array of strata in alphabetical order
     */
    public var strataKeys: [String] {
        return self.first?.loci.keys.sorted(by: { $0.compare($1, options: .numeric) == .orderedAscending }) ?? [String]()
    }
    
    /**
     Spatial Keys
     - Returns: An array of spatial keys
     */
    public var coordinateKeys: [String] {
        return self.first?.coord?.keys ?? [String]()
    }
    
    /**
     All keys for individual including loci and coordinates.
     - Returns: Array of keys.
     */
    public var allKeys: [String] {
        var ret = [String]()
        ret.append(contentsOf: self.strataKeys )
        ret.append(contentsOf: self.coordinateKeys )
        ret.append(contentsOf: self.locusKeys )
        return ret
    }
    
    /**
     All locations
     - Returns: Array of `CLLocationCoordinate2D` objects from all individuals
     */
    public var spatialLocations: [CLLocationCoordinate2D] {
        return self.compactMap{ CLLocationCoordinate2D(coordinate: $0.coord ?? Coordinate() ) }
    }
        
    /**
     Get all the genotypes for a single locus
     */
    public func getGenotypes( named: String ) -> [Genotype] {
        return self.compactMap{ $0.loci[named, default: Genotype() ] }
    }
    
    /**
     Get all the strata for a single location
     - Parameters:
      - named: The name of the stratum of interest.
     - Returns: An array of values with the stratumfo reach indiviudal.
     */
    public func getStrata( named: String ) -> [String] {
        return self.compactMap{ $0.strata[named, default: ""]}
    }
    
    /**
     Get the levels for a specfic stratum
     - Parameters:
      - stratum: The Name of the strtatum
     - Returns: The set of unique values in the stratum
     */
    public func strataLevels( stratum: String) -> [String] {
        return Set<String>( self.getStrata(named: stratum) ).unique()
    }
    
    
    
    
    
    
}


