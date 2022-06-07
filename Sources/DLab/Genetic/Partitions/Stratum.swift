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
//  Stratum.swift
//
//
//  Created by Rodney Dyer on 5/9/22.
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

import MapKit
import Foundation
import CoreLocation

public class Stratum: Codable {
    public var id: UUID = .init()
    public var individuals: [Individual] = []
    public var frequencies: [String: AlleleFrequencies] = [:]

    public var mother: Individual?

    subscript(index: Int) -> Individual {
        get {
            return individuals[index]
        }
        set {
            individuals[index] = newValue
        }
    }

    public var isFamily: Bool {
        return mother != nil
    }

    public var count: Int {
        return individuals.count
    }

    public var header: [String] {
        var ret = [String]()
        if !individuals.isEmpty,
           let ind = individuals.first
        {
            ret.append(contentsOf: ind.strata.keys.sorted(by: { $0.compare($1, options: .numeric) == .orderedAscending }))
            ret.append("Longitude")
            ret.append("Latitude")
            ret.append(contentsOf: ind.loci.keys.sorted(by: { $0.compare($1, options: .numeric) == .orderedAscending }))
        }
        return ret
    }

    public init() {}

    public init(mom: Individual) {
        if !mom.strata.keys.contains("Stage") {
            mom.strata["Stage"] = "Mother"
        }
        mother = mom
    }
}

public extension Stratum {
    func addIndividual(ind: Individual) {
        for locus in ind.loci.keys.sorted() {
            if let geno = ind.loci[locus] {
                frequencies[locus, default: AlleleFrequencies()].addGenotype(geno: geno)
            }
        }
        individuals.append(ind)
    }

    func addOffspring(offspring: Individual) {
        if let mom = mother {
            for locus in offspring.loci.keys {
                if var oGeno = offspring.loci[locus],
                   let mGeno = mom.loci[locus]
                {
                    oGeno.setMasking(parent: mGeno)
                    offspring.loci[locus] = oGeno
                }
            }
        }

        if !offspring.strata.keys.contains("Stage") {
            offspring.strata["Stage"] = "Offspring"
        }
        addIndividual(ind: offspring)
    }
}

extension Stratum: CustomStringConvertible {
    
    public var description: String {
        var ret = "Data:\n"
        if let mom = mother {
            ret += String("\(mom)\n")
        }
        for ind in individuals {
            ret += String("\(ind)\n")
        }
        return ret
    }
}

extension Stratum: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    public static func == (lhs: Stratum, rhs: Stratum) -> Bool {
        return lhs.id == rhs.id
    }
}



// MARK: - Extension for Spatial Stuff
public extension Stratum {
    
    var coordinates: [CLLocationCoordinate2D] {
        if self.isFamily {
            if let mom = self.mother,
               let coord = mom.coord {
                return [ CLLocationCoordinate2D(coordinate: coord)]
            }
            else {
                return Array<CLLocationCoordinate2D>()
            }
        } else {
            return self.individuals.spatialLocations
        }
    }
    
    var region: MKCoordinateRegion {
        return self.coordinates.region
    }
    
}






// MARK: - Extensions for Default Values
public extension Stratum {
    
    
    static func DefaultFamily() -> Stratum {
        let headers = ["ID", "OffID", "DNA_type", "type", "longitude", "latitude", "cf020", "cf125", "cf213", "cf273", "cf581", "cf585", "cf597", "cf634", "cf701"]

        let data = [["1024PWP", "0", "maternal", "native", "-77.589796", "37.353826", "124:146", "153:157", "128:136", "138:138", "232:232", "177:187", "107:99", "106:108", "130:130"],
                    ["1024PWP", "3040", "offspring", "native", "-77.589796", "37.353826", "124:142", "153:153", "128:164", "134:138", "232:232", "177:181", "105:107", "100:106", "120:130"],
                    ["1024PWP", "3042", "offspring", "native", "-77.589796", "37.353826", "124:138", "157:157", "136:142", "138:138", "232:232", "169:177", "107:107", "108:118", "124:130"],
                    ["1024PWP", "3043", "offspring", "native", "-77.589796", "37.353826", "124:140", "153:155", "122:128", "138:138", "232:232", "177:179", "109:99", "106:108", "130:130"],
                    ["1024PWP", "3045", "offspring", "native", "-77.589796", "37.353826", "126:146", "153:157", "128:136", "134:138", "232:232", "177:187", "103:107", "106:108", ""],
                    ["1024PWP", "3047", "offspring", "native", "-77.589796", "37.353826", "120:146", "153:157", "136:164", "134:138", "224:232", "167:177", "105:107", "100:108", "120:130"],
                    ["1024PWP", "3050", "offspring", "native", "-77.589796", "37.353826", "124:146", "155:157", "136:170", "126:138", "222:232", "171:187", "107:115", "106:108", "126:130"],
                    ["1024PWP", "3051", "offspring", "native", "-77.589796", "37.353826", "146:146", "153:157", "136:136", "138:138", "222:232", "171:177", "107:115", "104:108", "130:130"],
                    ["1024PWP", "3052", "offspring", "native", "-77.589796", "37.353826", "124:138", "155:157", "136:148", "138:138", "232:232", "177:183", "99:99", "106:118", ""],
                    ["1024PWP", "3054", "offspring", "native", "-77.589796", "37.353826", "146:146", "153:157", "136:144", "138:138", "232:232", "169:177", "107:113", "106:106", "128:130"],
                    ["1024PWP", "3056", "offspring", "native", "-77.589796", "37.353826", "140:146", "153:157", "128:130", "138:138", "232:232", "171:177", "107:115", "106:108", "130:130"],
                    ["1024PWP", "3057", "offspring", "native", "-77.589796", "37.353826", "140:146", "153:157", "128:130", "138:138", "232:232", "177:179", "105:99", "106:108", "124:130"],
                    ["1024PWP", "3058", "offspring", "native", "-77.589796", "37.353826", "124:150", "153:157", "114:136", "134:138", "232:232", "177:187", "107:107", "108:108", ""],
                    ["1024PWP", "3059", "offspring", "native", "-77.589796", "37.353826", "146:146", "155:157", "136:140", "134:138", "232:232", "187:187", "107:115", "106:108", "126:130"],
                    ["1024PWP", "3060", "offspring", "native", "-77.589796", "37.353826", "124:146", "153:155", "128:170", "138:138", "222:232", "171:177", "107:117", "108:108", ""],
                    ["1024PWP", "3061", "offspring", "native", "-77.589796", "37.353826", "120:124", "153:157", "136:164", "134:138", "232:232", "167:187", "107:107", "106:108", "118:130"]]

        /* Set up the maternal individual */
        let mom = Individual()
        mom.strata["MomID"] = data[0][0]
        if let lon = Double(data[0][5]),
           let lat = Double(data[0][6])
        {
            mom.coord = Coordinate(longitude: lat, latitude: lon)
        }
        for i in 6 ..< 15 {
            mom.loci[headers[i]] = Genotype(raw: data[0][i])
        }

        let family = Stratum(mom: mom)
        for i in 1 ..< 16 {
            let off = Individual()
            off.strata["MomID"] = data[i][0]
            if let lon = Double(data[i][5]),
               let lat = Double(data[i][6])
            {
                off.coord = Coordinate(longitude: lat, latitude: lon)
            }
            for j in 6 ..< 15 {
                off.loci[headers[j]] = Genotype(raw: data[i][j])
            }
            family.addOffspring(offspring: off)
        }

        print("family with \(family.count) offspring")

        return family
    }

    
    
    
    static func DefaultStratum() -> Stratum {
        let raw = [
            ["NBP", "88", "29.32544972", "-114.2935239", "1:1", "", "2:4", "1:2", "", "", "9:9", "7:7"],
            ["NBP", "88", "29.32543502", "-114.2934676", "1:1", "1:3", "1:1", "1:1", "1:1", "8:9", "9:9", "7:7"],
            ["NBP", "88", "29.32550936", "-114.2934508", "1:1", "1:3", "1:1", "1:1", "1:1", "8:9", "9:9", "5:7"],
            ["NBP", "88", "29.32545785", "-114.2934578", "1:1", "1:1", "1:2", "1:1", "1:1", "8:9", "9:9", "7:7"],
            ["NBP", "88", "29.32543401", "-114.2934718", "1:1", "1:3", "1:2", "1:1", "1:1", "8:9", "9:9", "5:5"],
            ["NBP", "88", "29.3255004", "-114.2934622", "1:1", "1:1", "1:2", "1:1", "1:1", "9:9", "9:9", "7:7"],
            ["NBP", "88", "29.32544338", "-114.2934972", "1:1", "1:1", "1:2", "1:1", "1:1", "7:9", "9:9", "5:7"],
            ["NBP", "88", "29.32541581", "-114.2935022", "1:1", "1:1", "1:2", "1:1", "1:1", "7:7", "9:9", "5:7"],
            ["NBP", "88", "29.32547339", "-114.2934413", "1:1", "1:3", "1:2", "1:1", "1:1", "9:10", "9:9", "7:7"],
            ["NBP", "88", "29.32550168", "-114.2934627", "1:1", "1:1", "1:1", "1:1", "1:2", "7:8", "9:9", "7:7"],
        ]

        let header = ["Region", "Pop", "Latitude", "Longitude", "LTRS", "WNT", "EN", "EF", "ZMP", "AML", "ATPS", "MP20"]
        let arapat = Stratum()

        for i in 0 ..< raw.count {
            let ind = Individual()
            ind.strata["Region"] = raw[i][0]
            ind.strata["Population"] = raw[i][1]
            if let lat = Double(raw[i][2]),
               let lon = Double(raw[i][3])
            {
                ind.coord = Coordinate(longitude: lon, latitude: lat)
            }
            for j in 4 ..< 12 {
                ind.loci[header[j]] = Genotype(raw: raw[i][j])
            }
            arapat.addIndividual(ind: ind)
        }

        return arapat
    }

}


