//
//  FoundationExtensions.swift
//  StarWars
//
//  Created by Eric Risco de la Torre on 22/01/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation

extension Bundle{
    
    func url(forResource name: String) -> URL?{
        
        // Partir el nombre por el .
        let tokens = name.components(separatedBy: ".")
        
        
        // Si sale bien, crear la url
        return url(forResource: tokens[0], withExtension: tokens[1])
        
    }
}
