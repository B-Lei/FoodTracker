//
//  Meal.swift
//  FoodTracker
//
//  Created by Ben Lei on 9/5/16.
//
//

import UIKit

class Meal {
    // MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: Initialization
    init?(name: String, photo: UIImage?, rating: Int) {
        // Initialize stored properties
        self.name = name
        self.photo = photo
        self.rating = rating
        
        // Return nil if no name or negative rating
        // Requires init to be optional (to return nil
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
}
