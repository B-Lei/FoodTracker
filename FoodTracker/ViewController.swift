//
//  ViewController.swift
//  FoodTracker
//
//  Created by Ben Lei on 8/30/16.
//
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    // UITextFieldDelegate protocol was adopted to make this ViewController a delegate of the text field
    // This lets you implement behaviors linked to the text field
    
    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field's user input through delegate callbacks
        nameTextField.delegate = self
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    // This is called after the text field resigns first responder status
    // Lets you use the entered text and do something with it
    func textFieldDidEndEditing(textField: UITextField) {
        // Changes the label to what was typed
        mealNameLabel.text = textField.text
    }

    // MARK: Actions
    @IBAction func setDefaultLabelText(sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
    
}

