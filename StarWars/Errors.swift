//
//  Errors.swift
//  StarWars
//
//  Created by Eric Risco de la Torre on 22/01/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation

enum StarWarsError : Error{
    case wrongUrlFormatForJSONResource
    case resourcePointedByUrlNotReachable
    case wrongJsonFormat
    case NotInStarWarsUniverse
}
