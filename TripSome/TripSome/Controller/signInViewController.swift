//
//  signInViewController.swift
//  TripSome
//
//  Created by AL Mustakim on 23/1/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit

class signInViewController: UIViewController,UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        buttonWork()
        self.loginEmailTextField.delegate = self
        self.loginPassTextField.delegate = self
        loginEmailTextField.becomeFirstResponder()
        
         }

         func textFieldShouldReturn(_ textField: UITextField) -> Bool {
             self.view.endEditing(true)
            loginPassTextField.becomeFirstResponder()
            if textField == loginPassTextField{
                
            buttonAction()
                
    }
            
             return false
         }
   // textField
    
    

    @IBOutlet weak var loginEmailTextField: UITextField!
    @IBOutlet weak var loginPassTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    
    
    let email = "bma@gmail.com"
    let pass = "1234"
    

    @IBAction func signInButton(_ sender: Any) {
        buttonAction()
    }
    
    @IBAction func signUpPageButton(_ sender: Any) {
       
        performSegue(withIdentifier: "signintosignup", sender: self)
    }
    
    func buttonWork(){
        signInButton.layer.borderColor = UIColor.green.cgColor
        signInButton.layer.borderWidth = 2
        signInButton.layer.cornerRadius = 20
       
        
    }
    func buttonAction(){
        if loginEmailTextField.text == email && loginPassTextField.text == pass
                 {
                     performSegue(withIdentifier: "signintohome", sender: self)
                           print("SIgned In Succesfully")
                 }
                 else{
                     var message = ""
                     if loginEmailTextField.text == email && loginPassTextField.text != pass{
                         message = " please check your password "
                     }
                     else if loginEmailTextField.text != email && loginPassTextField.text == pass{
                         
                         message = " please check your email "
                     }
                     else{
                         message = " please check your email and Password "
                     }
                     
                     
                     let alert = UIAlertController(title: "Wrong Inormation", message: "\(message)", preferredStyle: .alert)
                     //alert.addAction(title="click",sty)
                     alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                     //self.(alert, animated: true, completion: nil)
                     self.present(alert, animated: true, completion: nil)
                     
                 }
    }
    
    
}
