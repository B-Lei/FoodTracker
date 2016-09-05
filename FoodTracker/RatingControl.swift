//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Ben Lei on 9/3/16.
//
//

import UIKit

class RatingControl: UIView {

    // MARK: Initialization
    // =============================================================
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Creates a button
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        button.backgroundColor = UIColor.redColor()
        // Adds the button to the RatingControl view
        addSubview(button)
    }
    
    // Tells stack view how to lay out the button
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: 240, height: 44)
    }

}
