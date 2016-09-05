//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Ben Lei on 9/3/16.
//
//

import UIKit

class RatingControl: UIView {
    // MARK: Properties
    // =============================================================
    var rating = 0
    var ratingButtons = [UIButton]()

    // MARK: Initialization
    // =============================================================
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Creates 5 buttons
        // Uses a _ iterator because we don't need the iteration number
        for _ in 0..<5 {
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
            button.backgroundColor = UIColor.redColor()
            
            // Attach the ratingButtonTapped action to the button object,
            // which is triggered on a .TouchDown event. The target is
            // self, which is the RatingControl class, where the action is defined.
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), forControlEvents: .TouchDown)
            
            // Adds the button to the RatingControl view
            ratingButtons += [button]
            addSubview(button)
        }
    }
    
    // Where layout code belongs
    override func layoutSubviews() {
        var buttonFrame = CGRect(x: 0, y: 0, width: 44, height: 44)
        // Offset each button's origin by the length of the button plus spacing
        // enumerate() returns a tuple with the index and the button
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (44+5))
            button.frame =  buttonFrame
        }
    }
    
    // Tells stack view how to lay out the button
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: 240, height: 44)
    }
    
    // MARK: Button Action
    // =============================================================
    func ratingButtonTapped(button: UIButton) {
        print("Button pressed 👍")
    }

}
