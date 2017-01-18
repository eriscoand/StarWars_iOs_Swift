//
//  StarWarsCharacters.swift
//  StarWars
//
//  Created by Eric Risco de la Torre on 18/01/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation
import UIKit

class StarWarsCharacter {
    
    //MARK: - Stored Properties
    let firstName   :   String?
    let lastName    :   String?
    let alias       :   String
    let sound       :   Data
    let photo       :   UIImage
    let wikiUrl     :   URL
    let affiliation :   StarWarsAffiliation
    
    
    //MARK: - Computed Properties
    var name : String?{
        get{
            
            if firstName != nil, lastName != nil {
                return alias
            }else if firstName != nil{
                return lastName
            }else{
                return "\(firstName) \(lastName)"
            }
        
        }
    }
    
    //MARK: - Initialization
    init(firstName: String?,
         lastName: String?,
         alias:String,
         sound: Data,
         photo: UIImage,
         wikiUrl: URL,
         affiliation: StarWarsAffiliation){
        
        self.firstName = firstName
        self.lastName = lastName
        self.alias = alias
        self.sound = sound
        self.photo = photo
        self.wikiUrl = wikiUrl
        self.affiliation = affiliation
        
    }
    
    //MARK: - Conv initialization - Characters with no name!
    convenience init(alias: String,
                     sound: Data,
                     photo: UIImage,
                     wikiUrl: URL,
                     affiliation: StarWarsAffiliation) {
        
        self.init(firstName: nil,
                  lastName: nil,
                  alias: alias,
                  sound: sound,
                  photo: photo,
                  wikiUrl: wikiUrl,
                  affiliation: affiliation)
        
    }
    
}

