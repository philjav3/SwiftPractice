//
//  LeftViewController.swift
//  Practice
//
//  Created by Phil Javinsky III on 5/16/17.
//  Copyright © 2017 Phil Javinsky III. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController, UITextViewDelegate {

    var canEdit = false
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var dateOfBirth: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var datePickerConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeLeft: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.showMainViewController))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        photoButton.isEnabled = false
        textView.isEditable = false
        dateOfBirth.isEnabled = false
        datePickerConstraint.constant = -187
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showMainViewController() {
        performSegue(withIdentifier: "leftUnwindID", sender: self)
    }
    
    @IBAction func goHome(_ sender: Any) {
        performSegue(withIdentifier: "leftUnwindID", sender: self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        datePickerConstraint.constant = -187
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    @IBAction func editPage(_ sender: Any) {
        canEdit = !canEdit
        
        if canEdit {
            editButton.setTitle("Done", for: .normal)
            photoButton.isEnabled = true
            textView.isEditable = true
            dateOfBirth.isEnabled = true
        }
        else {
            editButton.setTitle("Edit", for: .normal)
            photoButton.isEnabled = false
            textView.isEditable = false
            dateOfBirth.isEnabled = false
            datePickerConstraint.constant = -187
            UIView.animate(withDuration: 0.5, animations: {
                self.view.layoutIfNeeded()
            })
            //textView.resignFirstResponder()
        }
        print("edit")
    }
    
    @IBAction func changePhoto(_ sender: Any) {
        print("changePhoto")
        /*if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }*/
    }

    @IBAction func changeDOB(_ sender: Any) {
        print("change date of birth")
        datePickerConstraint.constant = 0
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        })
        
        datePicker.isEnabled = true
        
        let datePicked = self.datePicker.date // get date from datePicker
        
        let formatter = DateFormatter() // format date to name of day
        formatter.dateFormat = "MM/dd/yyyy"
        //formatter.dateStyle = .short
        
        dateOfBirth.setTitle("Date of birth: \(formatter.string(from: datePicked))", for: .normal)
    }
    
}

