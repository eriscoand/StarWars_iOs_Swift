//
//  ForceSensitives.swift
//  StarWars
//
//  Created by Eric Risco de la Torre on 19/01/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation
import UIKit

class ForceSensitives : StarWarsCharacter{
    
    //MARK: - Stored Properties
    let  midichlorians : Int
    
    //MARK: - Initialization
    init(firstName: String?,
         lastName: String?,
         alias: String,
         sound: Data,
         photo: UIImage,
         wikiUrl: URL,
         affiliation: StarWarsAffiliation,
         midichlorians: Int) {
        
        self.midichlorians = midichlorians
        super.init(firstName: firstName, lastName: lastName,
                   alias: alias, sound: sound,
                   photo: photo, wikiUrl: wikiUrl,
                   affiliation: affiliation)
        
    }
    
    convenience init(jediWithFirstName: String?, lastName: String?,
                     alias: String, sound: Data,
                     photo: UIImage, wikiUrl: URL,
                     midichlorians: Int) {
        
        
        self.init(firstName: jediWithFirstName,
                  lastName: lastName,
                  alias: alias,
                  sound: sound,
                  photo: photo,
                  wikiUrl: wikiUrl,
                  affiliation: .rebelAlliance,
                  midichlorians: midichlorians)
        
    }
    
    convenience init(sithWithFirstName: String?, lastName: String?,
                     alias: String, sound: Data,
                     photo: UIImage, wikiUrl: URL,
                     midichlorians: Int) {
        
        
        self.init(firstName: sithWithFirstName,
                  lastName: lastName,
                  alias: alias,
                  sound: sound,
                  photo: photo,
                  wikiUrl: wikiUrl,
                  affiliation: .galacticEmpire,
                  midichlorians: midichlorians)
        
    }
    
}
