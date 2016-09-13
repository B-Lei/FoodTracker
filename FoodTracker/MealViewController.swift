//
//  MealViewController.swift
//  FoodTracker
//
//  Created by Ben Lei on 8/30/16.
//
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // UITextFieldDelegate protocol was adopted to make this ViewController a delegate of the text field
    // This lets you implement behaviors linked to the text field
    
    // MARK: Properties
    // =============================================================
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field's user input through delegate callbacks
        nameTextField.delegate = self
    }
    
    // MARK: UITextFieldDelegate
    // =============================================================
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard after pressing Return
        textField.resignFirstResponder()
        return true
    }
    // This is called after the text field resigns first responder status
    // Lets you use the entered text and do something with it
    func textFieldDidEndEditing(textField: UITextField) {
        // Changes the label to what was typed
    }

    // MARK: UIImagePickerControllerDelegate
    // =============================================================
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled
        dismissViewControllerAnimated(true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        // The info dictionary contains multiple representations of the image, and this uses the original
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set photoImageView to display the selected image
        photoImageView.image = selectedImage
        
        // Dismiss the picker
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: Actions
    // =============================================================
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        // Hide the keyboard
        // Makes sure that keyboard is hidden if you tap the image picker while typing
        nameTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken
        imagePickerController.sourceType = .PhotoLibrary
        
        // Make sure ViewController is notified when the user picks an image
        imagePickerController.delegate = self
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
}

