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
    var rating = 0 {
        // This is a property observer (is called when the variable changes value)
        // Forces the subviews to update their layout to reflect the star rating
        didSet {
            setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]()
    let spacing = 5
    let starCount = 5

    // MARK: Initialization
    // =============================================================
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        
        // Creates 5 buttons
        // Uses a _ iterator because we don't need the iteration number
        for _ in 0..<starCount {
            // OLD:
            // let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
            
            // NEW: (button frames are set in layoutSubviews already --
            // no need to set them when you create them)
            let button = UIButton()
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            // Don't need the below if we're using images for the buttons
            // button.backgroundColor = UIColor.redColor()
            
            // Makes sure button image doesn't show additional highlight during state change
            button.adjustsImageWhenHighlighted = false
            
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
        
        // It's important to update button selection state then view loads,
        // not just when the rating changes
        updateButtonSelectionStates()
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
        rating = ratingButtons.indexOf(button)! + 1
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerate() {
            // If the index of a button is less than the rating, make it selected
            button.selected = index < rating
        }
    }
}
