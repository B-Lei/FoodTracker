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
    let spacing = 5
    let starCount = 5

    // MARK: Initialization
    // =============================================================
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Creates 5 buttons
        // Uses a _ iterator because we don't need the iteration number
        for _ in 0..<starCount {
            // OLD:
            // let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
            
            // NEW: (button frames are set in layoutSubviews already --
            // no need to set them when you create them)
            let button = UIButton()
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
        // Set the button's width and height to a square the size of the frame's height
        let buttonSize =  Int(frame.size.height)
        
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        // Offset each button's origin by the length of the button plus spacing
        // enumerate() returns a tuple with the index and the button
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame =  buttonFrame
        }
    }
    
    // Tells stack view how to lay out the button
    override func intrinsicContentSize() -> CGSize {
        // OLD:
        // return CGSize(width: 240, height: 44)
        
        // NEW:
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize * starCount) + (spacing * (starCount - 1))
        return CGSize(width: width, height: buttonSize)
    }
    
    // MARK: Button Action
    // =============================================================
    func ratingButtonTapped(button: UIButton) {
        print("Button pressed 👍")
    }

}
