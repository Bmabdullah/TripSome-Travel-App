//
//  signUpViewController.swift
//  TripSome
//
//  Created by AL Mustakim on 26/1/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit

class signUpViewController: UIViewController,UITextFieldDelegate {

    //outlets
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // deleget text field
        TextFieldDeligate()
        
        userNameTextField.becomeFirstResponder()
        
        buttonwork()
    }

    @IBOutlet weak var signUpButton: UIButton!
    

   
    @IBAction func signInPageButton(_ sender: Any) {
        
       // performSegue(withIdentifier: "signuptosignin", sender: self)
        self.dismiss(animated: true, completion: nil)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        //emailTextField.becomeFirstResponder()
        if textField == userNameTextField{
            emailTextField.becomeFirstResponder()
        }
        else if textField == emailTextField{
            passwordTextField.becomeFirstResponder()
        }
        else if textField == passwordTextField{
            confirmPasswordTextField.becomeFirstResponder()
        }
        else if textField == confirmPasswordTextField{
            signUpButtonAction()
        }
        return false
    }
    
    
    
  
    
}

extension signUpViewController{
    
    func buttonwork(){
          signUpButton.layer.borderColor = UIColor.green.cgColor
          signUpButton.layer.borderWidth = 2
          signUpButton.layer.cornerRadius = 20
      }
   
    func TextFieldDeligate(){
        self.userNameTextField.delegate = self
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        self.confirmPasswordTextField.delegate = self
    }
// signup action
    
    func signUpButtonAction(){
           
       }
    
}
