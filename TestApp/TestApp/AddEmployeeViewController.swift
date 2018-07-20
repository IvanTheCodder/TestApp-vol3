//
//  AddEmployeeViewController.swift
//  TestApp
//
//  Created by Ivan Skorik on 7/19/18.
//  Copyright © 2018 Ivan Skorik. All rights reserved.
//

import UIKit

class AddEmployeeViewController: UIViewController, UITextFieldDelegate {
    //Variables, Outlets
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var dateOfBirthDatePicker: UIDatePicker!
    @IBOutlet weak var salaryTextField: UITextField!
    
    var delegate: AddEmployeeViewControllerDelegate?
    var model: Model?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //hide keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if touches.first != nil {
            view.endEditing(true)
        }
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        
        if firstNameTextField.text != "" {
            let name = firstNameTextField.text
            if lastNameTextField.text != "" {
                let lastName = lastNameTextField.text
                if salaryTextField.text != "" {
                    let salary = salaryTextField.text
                    model = Model(name: name!, lastName: lastName!, dateOfBirth: dateOfBirthDatePicker.date, salary: Decimal(string: salary!)!)
                    delegate?.didTapSaveButton(model: model!)
                    self.navigationController?.popViewController(animated: true)
                } else {
                    alert(title: "Поля не заполнены", message: "Заполните все поля", style: .alert)
                }
            } else {
                alert(title: "Поля не заполнены", message: "Заполните все поля", style: .alert)
            }
        } else {
            alert(title: "Поля не заполнены", message: "Заполните все поля", style: .alert)
        }
    }
    
    //alert
    func alert(title: String, message: String, style: UIAlertControllerStyle) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    //UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


protocol AddEmployeeViewControllerDelegate: class {
    func didTapSaveButton(model: Model)
}

