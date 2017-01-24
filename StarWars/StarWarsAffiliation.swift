//
//  StarWarsAffiliation.swift
//  StarWars
//
//  Created by Eric Risco de la Torre on 19/01/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation


enum StarWarsAffiliation : String{
    
    case galacticEmpire = "Galactic Empire"
    case rebelAlliance = "Rebel Alliance"
    case firstOrder = "First Order"
    case hutt = "Jabba's Criminal Empire"
    case unknown = "Unknown"
 
    
    static func by(name: String) -> StarWarsAffiliation{
        
        let affiliation : StarWarsAffiliation
        
        switch name {
        case StarWarsAffiliation.galacticEmpire.rawValue:
            affiliation = .galacticEmpire
        case StarWarsAffiliation.rebelAlliance.rawValue:
            affiliation = .rebelAlliance
        case StarWarsAffiliation.firstOrder.rawValue:
            affiliation = .firstOrder
        case StarWarsAffiliation.hutt.rawValue:
            affiliation = .hutt
        default:
            affiliation = .unknown
        }
        
        return affiliation
        
    }
    
    static func by(name: String?) -> StarWarsAffiliation{
        
        guard let name = name else{
            return .unknown
        }
        
        return by(name: name)
    }
    
}
