//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Ben Lei on 8/30/16.
//
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    // MARK: FoodTracker tests
    
    // Tests to confirm that the Meal initializer returns nil when [no name] or [negative rating] is provided
    func testMealInitialization() {
        // Success case
        let potentialItem = Meal(name: "newest meal", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)
        
        // Failure cases
        let noName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(noName, "Empty name is invalid")
        
        let badRating = Meal(name: "Really bad rating", photo: nil, rating: -1)
        XCTAssertNil(badRating)
    }
}
