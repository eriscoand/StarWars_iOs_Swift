//
//  CharacterViewController.swift
//  StarWars
//
//  Created by Eric Risco de la Torre on 24/01/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {

    let model : StarWarsCharacter
    @IBOutlet weak var CharacterImage: UIImageView!
    
    init(model: StarWarsCharacter){
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        syncViewWithModel();
    }
    
    func syncViewWithModel(){
        CharacterImage.image = model.photo
        title = model.name
    }
    
    @IBAction func playSound(_ sender: Any) {
    }

    @IBAction func openWiki(_ sender: Any) {
    }
}
