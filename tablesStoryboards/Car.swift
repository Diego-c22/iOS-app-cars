//
//  Car.swift
//  tablesStoryboards
//
//  Created by J Antonio Enciso S on 23/09/22.
//

import Foundation
import UIKit

class Car {
    
    //MARK: Properties
    
    var photo: String
    var garantee: String
    var kilometers: Int
    var year: Int
    var price: Float
    var brand: String
    var model: String
    var engine: String
    
    
    init?(engine: String, photo: String, garantee: String, kilometers: Int, year: Int, price: Float, brand: String, model: String) {
        
        self.engine = engine
        self.photo = photo
        self.kilometers = kilometers
        self.garantee = garantee
        self.brand = brand
        self.model = model
        self.price = price
        self.year = year
        
        if brand.isEmpty || model.isEmpty  {
            return nil
        }
    }
    
}
