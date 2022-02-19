//
//  Constants.swift
//  StarTrivia
//
//  Created by Hamza on 12/24/21.
//  Copyright © 2021 Hamza. All rights reserved.
//

import UIKit


let BLACK_BG = UIColor.black.withAlphaComponent(0.6).cgColor

let URL_BASE = "https://swapi.dev/api/"
let PERSON_URL = URL_BASE + "people/"

typealias PersonResponseCompletion = (Person?) -> Void
typealias HomeworldResponseCompletion = (Homeworld?) -> Void
typealias VehicleResponseCompletion = (Vehicle?) -> Void
typealias StarshipResponseCompletion = (Starship?) -> Void
typealias FilmResponseCompletion = (Film?) -> Void


 
