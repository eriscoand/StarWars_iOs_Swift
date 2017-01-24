//
//  JSONProcessing.swift
//  StarWars
//
//  Created by Eric Risco de la Torre on 22/01/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation
import UIKit

/*
 {
 "firstName"    : "Anakin",
 "lastName"     : "Skywalker",
 "alias"        : "Darth Vader",
 "soundFile"    : "vader.caf",
 "imageFile"    : "vader.jpg",
 "jedi"         : false,
 "sith"         : true,
 "affiliation"  : "Galactic Empire",
 "url"          : "https://en.wikipedia.org/wiki/Darth_Vader",
 "midichlorians": 15000
 }
 */

//MARK: - Alias
typealias JSONObject = AnyObject;
typealias JSONDictonary = [String: JSONObject];
typealias JSONArray = [JSONDictonary];


//MARK: - Functions
func decodeCharacter(starWarsCharacter json: JSONDictonary) throws -> StarWarsCharacter {
    
    guard let urlString = json["url"] as? String,
        let url = URL(string:urlString) else{
            throw StarWarsError.wrongUrlFormatForJSONResource
    }
    guard let urlImage = json["imageFile"] as? String,
        let image = UIImage(named:urlImage) else{
            throw StarWarsError.resourcePointedByUrlNotReachable
    }
    guard let urlSound = json["soundFile"] as? String,
        let soundUrl = Bundle.main.url(forResource: urlSound),
        let sound = try? Data(contentsOf: soundUrl) else{
            throw StarWarsError.resourcePointedByUrlNotReachable
    }
    
    let firsName = json["firstName"] as? String
    let lastName = json["lastName"] as? String
    let alias = json["alias"] as? String
        
    let affiliation = StarWarsAffiliation.by(name: json["affiliation"] as? String)
    
    return StarWarsCharacter(firstName: firsName,
                             lastName: lastName,
                             alias: alias,
                             sound: sound,
                             photo: image,
                             wikiUrl: url,
                             affiliation: affiliation)
    
}

func decodeCharacter(starWarsCharacter json: JSONDictonary?) throws -> StarWarsCharacter{
    
    guard let json = json else{
        throw StarWarsError.wrongJsonFormat
    }
    
    return try decodeCharacter(starWarsCharacter: json)

}

func decodeCharacter(forceSensitive json: JSONDictonary) throws -> ForceSensitives{
    
    let sw = try decodeCharacter(starWarsCharacter: json)
    
    guard let jedi = json["jedi"] as? Bool,
          let sith = json["sith"] as? Bool,
        let md = json["midichlorians"] as? Int else{
            throw StarWarsError.wrongJsonFormat
    }
    
    return ForceSensitives(firstName: sw.firstName,
                           lastName: sw.lastName,
                           alias: sw.alias,
                           sound: sw.sound,
                           photo: sw.photo,
                           wikiUrl: sw.wikiUrl,
                           affiliation: sw.affiliation,
                           midichlorians: md)
    
    
}

func decodeCharacter(forceSensitive json: JSONDictonary?) throws -> ForceSensitives{
    
    guard let json = json else{
        throw StarWarsError.wrongJsonFormat
    }
    
    return try decodeCharacter(forceSensitive: json)
    
}

func decodeCharacters(characters json: JSONArray) throws -> [StarWarsCharacter]{
    
    return try json.flatMap({try decodeCharacter(starWarsCharacter: $0)})
    
}

func decodeCharacters(characters json: JSONArray?) throws -> [StarWarsCharacter]{
    
    guard let json = json else{
        throw StarWarsError.wrongJsonFormat
    }
    
    return try decodeCharacters(characters: json)

}

func decodeCharacters(forceSensitives json: JSONArray) throws -> [ForceSensitives]{
    
    return try json.flatMap({try decodeCharacter(forceSensitive: $0)})
    
}

func decodeCharacters(forceSensitives json: JSONArray?) throws -> [ForceSensitives]{
    
    guard let json = json else{
        throw StarWarsError.wrongJsonFormat
    }
    
    return try decodeCharacters(forceSensitives: json)
    
}

func loadFromLocalFile(fileName name: String, bundle: Bundle = Bundle.main) throws -> JSONArray{
    
    if let url = bundle.url(forResource: name),
        let data = try? Data(contentsOf: url),
        let maybeArray = try? JSONSerialization.jsonObject(with: data,
                                                           options: JSONSerialization.ReadingOptions.mutableContainers) as? JSONArray,
        let array = maybeArray {
        return array
    }else{
        throw StarWarsError.wrongJsonFormat
    }
    
}


