//
//  FilmsVC.swift
//  StarTrivia
//
//  Created by Hamza on 1/1/22.
//  Copyright © 2022 Hamza. All rights reserved.
//

import UIKit

class FilmsVC: UIViewController, PersonProtocol {
    
    @IBOutlet weak var titleLbl: UILabel!    
    @IBOutlet weak var episodeLbl: UILabel!
    @IBOutlet weak var directorLbl: UILabel!
    @IBOutlet weak var producerLbl: UILabel!
    @IBOutlet weak var releadesLbl: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var crawlLbl: UITextView!
  
    var person: Person!
    var api = FilmApi()
    var films = [String]()
    var currentFilm = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        films = person.filmUrls
        previousBtn.isEnabled = false
        nextBtn.isEnabled = films.count > 1
        guard let firstFilm = films.first else { return }
        getFilm(url: firstFilm)
        
    }
    

    func getFilm(url: String){
        api.getFilm(url: url) { (film) in
            if let film = film {
                
                self.setupView(film: film)
            }
        }
    }

    func setupView(film: Film) {
        titleLbl.text = film.title
        episodeLbl.text = String(film.episode)
        directorLbl.text = film.director
        producerLbl.text = film.producer
        releadesLbl.text = film.releaseData
        crawlLbl.text = film.crawl
    }
    
    
    @IBAction func previousClicked(_ sender: Any) {
        currentFilm -= 1
        setButtonState()
    }
    
    
    @IBAction func nextClicked(_ sender: Any) {
        currentFilm += 1
        setButtonState()
        
    }
    
    func setButtonState(){
        nextBtn.isEnabled = currentFilm == films.count - 1 ? false : true
        previousBtn.isEnabled = currentFilm == 0 ? false : true
        getFilm(url: films[currentFilm])
        
    }
    
    
    

}
