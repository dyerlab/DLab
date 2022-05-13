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

import CoreLocation
import Foundation
import MapKit

/**
 Extensions for arrays  of individuals
 */

public extension Array where Element == Individual {
    /**
     Names of the loci
     - Returns: An array of locus names.
     */
    var locusKeys: [String] {
        return first?.loci.keys.sorted(by: { $0.compare($1, options: .numeric) == .orderedAscending }) ?? [String]()
    }

    /**
     Strata Keys
     - Returns: An array of strata in alphabetical order
     */
    var strataKeys: [String] {
        return first?.loci.keys.sorted(by: { $0.compare($1, options: .numeric) == .orderedAscending }) ?? [String]()
    }

    /**
     All keys for individual including loci and coordinates.
     - Returns: Array of keys.
     */
    var allKeys: [String] {
        var ret = [String]()
        ret.append(contentsOf: strataKeys)
        ret.append("Longitude")
        ret.append("Latitude")
        ret.append(contentsOf: locusKeys)
        return ret
    }

    /**
     All locations
     - Returns: Array of `CLLocationCoordinate2D` objects from all individuals
     */
    var spatialLocations: [CLLocationCoordinate2D] {
        let coords = compactMap { $0.coord }
        return coords.compactMap { CLLocationCoordinate2D(coordinate: $0) }
    }

    /**
     Get all the genotypes for a single locus
     */
    func getGenotypes(named: String) -> [Genotype] {
        return compactMap { $0.loci[named, default: Genotype()] }
    }

    /**
     Get all the strata for a single location
     - Parameters:
      - named: The name of the stratum of interest.
     - Returns: An array of values with the stratumfo reach indiviudal.
     */
    func getStrata(named: String) -> [String] {
        return compactMap { $0.strata[named, default: ""] }
    }

    /**
     Get the levels for a specfic stratum
     - Parameters:
      - stratum: The Name of the strtatum
     - Returns: The set of unique values in the stratum
     */
    func strataLevels(stratum: String) -> [String] {
        return Set<String>(getStrata(named: stratum)).unique()
    }

    /**
     Gets subset of individuals who have specific hierarchical level
     - Parameters:
        - stratumName: Name of the hierarchical level to look.
        - stratumLevel: The specific level for the stratum of interest
     - Returns: An array of individuals (or empty array) with indiviudals
     */
    func indiviudalsForStratumLevel(stratumName: String, stratumLevel: String) -> [Individual] {
        let ret = filter { $0.strata[stratumName] == stratumLevel }

        return ret
    }
}
