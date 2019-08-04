//
//  AddABookViewController.swift
//  LibraryBooks
//
//  Created by Jess Payton on 8/3/19.
//  Copyright © 2019 Jess Payton. All rights reserved.
//

import UIKit

final class AddABookViewController: UIViewController {
    @IBOutlet weak var bookTitleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var numberOfPages: UITextField!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var dateReadTextField: UITextField!
    @IBOutlet weak var noteTextView: UITextView!
    
    private var datePicker: UIDatePicker!
    private var model: AddABookModel!
    //validate text field
    //If the Title and Author is left blank, or if those fields have "No Title" / "No Name", then return false.
    private var validateTitleField: Bool {return (bookTitleTextField.text != "No Title" && bookTitleTextField.text != "")}
    private var validateAuthorField: Bool {return (authorTextField.text != "No Name" && authorTextField.text != "")}
}

extension AddABookViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.addTarget(self, action: #selector(AddABookViewController.datePickerValueChanged(sender:)), for: UIControl.Event.valueChanged)
    
        dateReadTextField.inputView = datePicker
        dateReadTextField.text = datePicker.date.toString(format: .yearMonthDay)
        //Don't let a user save a book title as "No Title" or author as "No Name". Set as place holder text instead."
        //If we leave as "No name", then it will require user to delete.
        //Enable or Disable addWorkoutButton accordingly.
        //initializeTitle()
        //initializeAuthor()
    }
    
    @objc func datePickerValueChanged(sender: UIDatePicker) {
        
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.medium
        formatter.timeStyle = DateFormatter.Style.none
        dateReadTextField.text = formatter.string(from: sender.date)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func initializeTitle(){
        //This function will look at the bookTitle to determine if the libraryBook object is a brand new object or not. If it is a new object by
        //bookTitle == "No Title", then move that text to placeholder so users do not have to delete the text and type in the real title.
        //This function only will enable/disable the add button. No need to repeat it in initializeAuthor.
        if (model.libraryBook.bookTitle == "No Title"){
            bookTitleTextField.placeholder = "No Title"
            bookTitleTextField.text = ""
            
        }
        else{
            bookTitleTextField.text = model.libraryBook.bookTitle
            
        }
    }
    
    private func initializeAuthor(){
        //This function will look at the author and place the text as a placeholder if it says "No Name".
        //initializeTitle already took care of disabling/enabling the add button. This function will not alter the property.
        if (model.libraryBook.author == "No Name"){
            authorTextField.placeholder = "No Name"
            authorTextField.text = ""
        }
        else{
            authorTextField.text = model.libraryBook.author            
        }
    }
}

extension AddABookViewController{
    func setup(model: AddABookModel){
        self.model = model
    }
}

extension AddABookViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        //addWorkoutButton.isEnabled = validateNameField      //set enable properties by testing to see if a workout name is populated
        return true
    }
}

extension AddABookViewController{
    
}
