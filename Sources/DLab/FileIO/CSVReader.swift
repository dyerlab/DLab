//
//  File.swift
//  
//
//  Created by Rodney Dyer on 10/29/22.
//

import Foundation

public struct CSVReader {
    let path: String
    let contents: [[String]]
    
    init(path: String ) {
        self.path = path
        do {
            let raw = try String(contentsOfFile: path)
            contents = raw.components(separatedBy: "\n").map { $0.components(separatedBy: ",") }
        }
        catch {
            contents = [[String]]()
        }
    }
    
    func asDataStore() -> DataStore? {
        guard let headers = contents.first else { return nil }
        let latCol = headers.firstIndex(of: "Latitude" )
        let lonCol = headers.firstIndex(of: "Longitude" )
        
        let ret = DataStore()
        
        
        return ret
    }
    
    
    
}
