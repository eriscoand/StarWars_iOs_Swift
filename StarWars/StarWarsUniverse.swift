//
//  StarWarsUniverse.swift
//  StarWars
//
//  Created by Eric Risco de la Torre on 23/01/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation
import UIKit

class StarWarsUniverse{
    
    typealias StarWarsArray = [StarWarsCharacter]
    typealias StarWarsDictionary = [StarWarsAffiliation : StarWarsArray]
    
    typealias ForceStarWarsArray = [ForceSensitives]
    typealias ForceStarWarsDictionary = [StarWarsAffiliation : ForceStarWarsArray]
    
    var dict : ForceStarWarsDictionary = ForceStarWarsDictionary()
    
    init(regularCharacters regularChars: StarWarsArray, forceSensitives forceChars: ForceStarWarsArray){
        dict = makeEmptyAffiliations()
        
        for each in regularChars{
            let downCast = ForceSensitives(firstName: each.firstName,
                                           lastName: each.lastName,
                                           alias: each.alias,
                                           sound: each.sound,
                                           photo: each.photo,
                                           wikiUrl: each.wikiUrl,
                                           affiliation: each.affiliation,
                                           midichlorians: 0)
            dict[each.affiliation]?.append(downCast)
        }
        
        for each in forceChars{
            dict[each.affiliation]?.append(each)
        }
        
    }
    
    
    var affiliationCount : Int{
        get{
            return dict.count
        }
    }
    
    func characterCount(forAffiliation affiliation: StarWarsAffiliation) -> Int{
        guard let count = dict[affiliation]?.count else{
            return 0
        }
        
        return count
    }
    
    func character(atIndex index: Int, forAffiliation affiliation: StarWarsAffiliation) throws -> ForceSensitives? {
        
        guard let chars = dict[affiliation] else{
            throw StarWarsError.NotInStarWarsUniverse
        }
        
        let char = chars[index]
        return char
        
    }
    
    func affiliationName(_ affiliation: StarWarsAffiliation) -> String{
        return affiliation.rawValue
    }
    
    func makeEmptyAffiliations() -> ForceStarWarsDictionary{
        
        var d = ForceStarWarsDictionary()
        
        d[.rebelAlliance] = ForceStarWarsArray()
        d[.galacticEmpire] = ForceStarWarsArray()
        d[.firstOrder] = ForceStarWarsArray()
        d[.hutt] = ForceStarWarsArray()
        d[.unknown] = ForceStarWarsArray()
        
        return d
        
    }
    
}
