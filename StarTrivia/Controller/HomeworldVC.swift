//
//  HomeworldVC.swift
//  StarTrivia
//
//  Created by Hamza on 1/1/22.
//  Copyright © 2022 Hamza. All rights reserved.
//

import UIKit

class HomeworldVC: UIViewController, PersonProtocol {
 
    var person: Person!
    let api = HomeworldApi()
    
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var climatelbl: UILabel!
    @IBOutlet weak var populationlbl: UILabel!
    @IBOutlet weak var terrainlbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        api.getHomeworld(url: person.homeworldUrl) { (homeworld) in
            if let homeworld = homeworld {
                self.setupUi(homeworld: homeworld)
                
            }
        }
        

    }
    
    func setupUi(homeworld: Homeworld){
        namelbl.text = homeworld.name
        climatelbl.text = homeworld.climate
        terrainlbl.text = homeworld.terrain
        populationlbl.text = homeworld.population
    }

}
