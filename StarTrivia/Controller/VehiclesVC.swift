//
//  VehiclesVC.swift
//  StarTrivia
//
//  Created by Hamza on 1/1/22.
//  Copyright © 2022 Hamza. All rights reserved.
//

import UIKit

class VehiclesVC: UIViewController, PersonProtocol {
   
    var person: Person!
    let api = VehicleApi()
    var vehicles = [String]()
    var currentVehicle = 0
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var legthLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var passengersLbl: UILabel!
    @IBOutlet weak var crewlbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var markLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vehicles = person.vehicleUrls
        nextBtn.isEnabled = vehicles.count > 1
        previousBtn.isEnabled = false
        guard let firstVehicle = vehicles.first else { return }
        getVehicle(url: firstVehicle)
       
    }
    
    func getVehicle(url: String) {
        api.getVehicle(url: url) { (vehicle) in
            if let vehicle = vehicle {
                self.setupView(vehicle: vehicle)
                
                
            }
        }
        
    }
    
    func setupView(vehicle: Vehicle){
        nameLbl.text = vehicle.name
        modelLbl.text = vehicle.model
        markLbl.text = vehicle.manufacturer
        costLbl.text = vehicle.cost
        legthLbl.text = vehicle.length
        speedLbl.text = vehicle.speed
        crewlbl.text = vehicle.crew
        passengersLbl.text = vehicle.passengers
    }
    
    
    @IBAction func previousClicked(_ sender: Any) {
        currentVehicle -= 1
        setButtonState()
    }
    
    
    @IBAction func nextClicked(_ sender: Any) {
        currentVehicle += 1
        setButtonState()
        
    }
    
    func setButtonState(){
        
        nextBtn.isEnabled = currentVehicle == vehicles.count - 1 ? false : true
        previousBtn.isEnabled = currentVehicle == 0 ? false : true
        
   /*     if currentVehicle == 0 {
            previousBtn.isEnabled = false
        } else {
            previousBtn.isEnabled = true
        }
        
        if currentVehicle == vehicles.count - 1 {
            nextBtn.isEnabled = false
        } else {
            nextBtn.isEnabled = true
        }*/
       
        getVehicle(url: vehicles[currentVehicle])
        
    }
    
}
