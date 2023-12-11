//
//  ViewController.swift
//  tablesStoryboards
//
//  Created by J Antonio Enciso S on 22/09/22.
//

import UIKit

class ViewController: UIViewController {
    var selectedCar: Car?
    
    @IBAction func Psuh(_ sender: Any) {
        performSegue(withIdentifier: "ExtraDetail", sender: nil)
    }
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var engine: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var garantee: UILabel!
    @IBOutlet weak var kilometers: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let car = selectedCar {
            print("inside", car.photo)
            image.image = UIImage(named: car.photo)
            name.text = car.model + " " + car.brand + " " + String(car.year)
            price.text = String(car.price)
            engine.text = car.engine
            garantee.text = car.garantee
            kilometers.text = String(car.kilometers) + " Kilometers"
        }
    }


}


