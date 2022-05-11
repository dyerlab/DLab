//
//  File.swift
//  
//
//  Created by Rodney Dyer on 5/10/22.
//

import Foundation


/// An enum to idicate the masking level for genotypes in family arrays.
public enum AlleleMasking: Int, Codable {
    
    /// No masking
    case NoMasking = 0
    
    /// Mother has left allele
    case MotherLeft
    
    /// Mother is right allele
    case MotherRight
    
    /// Cannot determine masking due to shared heterozygote
    case Undefined
    
    /// Missing data
    case MissingData
}




