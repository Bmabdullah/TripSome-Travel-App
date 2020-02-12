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
        @IBOutlet weak var signUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // deleget text field
        TextFieldDeligate()
        
        userNameTextField.becomeFirstResponder()
        
        buttonwork()
    }


    @IBAction func signUpButton(_ sender: Any) {
        
        print(userNameTextField.text ?? "")
        print(emailTextField.text ?? "")
        print(passwordTextField.text ?? "")
        print(confirmPasswordTextField.text ?? "")
        signUpButtonAction()
        signup()
        
    }
    
    

   
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
        if passwordTextField.text == confirmPasswordTextField.text{
            if userNameTextField.text != "" && emailTextField.text != "" && passwordTextField.text != "" {
                
                
                
                
                print("succesfully loged in")
                
            }
            else{
                print("you can't signup with emply field ")
            }
        }
        else{
            print("password doen't match ! ")
        }
       }
    
}

extension signUpViewController{
    func signup(){
               
               guard let userName = userNameTextField.text else {
                   print("email not found")
                   return
               }
               guard let email = emailTextField.text else {
                   print("password not found")
                   return
               }
                guard let password = passwordTextField.text else {
                    print("email not found")
                    return
                }
                guard let confirmPassword = confirmPasswordTextField.text else {
                    print("password not found")
                    return
                }
               
               print(userName)
                print(email)
                print(password)
               print(confirmPassword)
               
               let json: [String: Any] = ["username": "\(userName)",
               "email": "\(email)","password": "\(password)",
               "password2": "\(confirmPassword)"]
               
               let jsonData = try? JSONSerialization.data(withJSONObject: json)
               
               guard let url = URL(string: "http://127.0.0.1:8000/api/v1/account/register") else { return }
               var request = URLRequest(url: url)
               request.httpMethod = "POST"
               request.setValue("application/json", forHTTPHeaderField: "Content-Type")
               request.httpBody = jsonData
               
        
               let task = URLSession.shared.dataTask(with: request) { data, response, error in
                   
                   if let data = data {
                                   do {
                                       let responseModel = try JSONDecoder().decode(UserBase.self, from: data)
                                    
                                    print("responce Model for user : " , responseModel)
                                    print(responseModel)
//                                    if responseModel.response == "successfully registered new user"{
//                                        
//                                    }
                   
                                       DispatchQueue.main.async {

                                          
                                           
                                       }
                                   }
                                   catch {
                                       print(error.localizedDescription)
                                       return
                                   }
                               }
                   
                   guard let data = data, error == nil else {
                       print(error?.localizedDescription ?? "No data")

                       return
                   }
                   let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                   if let responseJSON = responseJSON as? [String: Any] {
                       print(responseJSON)
                       
                       

                   }
               }
        task.resume()
               
           }
}
