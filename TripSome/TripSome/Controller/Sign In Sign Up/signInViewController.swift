//
//  signInViewController.swift
//  TripSome
//
//  Created by AL Mustakim on 23/1/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit

class signInViewController: UIViewController,UITextFieldDelegate {
    
    let defaults = UserDefaults.standard
    let tokenSave = UserDefaults.standard
    var tt : String = ""
    
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
        //            if textField == loginPassTextField{
        //
        //            buttonAction()
        //
        //    }
        
        return false
    }
    // textField
    
    
    
    @IBOutlet weak var loginEmailTextField: UITextField!
    @IBOutlet weak var loginPassTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    @IBAction func signInButton(_ sender: Any) {
        buttonAction()
    }
    
    @IBAction func signUpPageButton(_ sender: Any) {
        
        performSegue(withIdentifier: "signintosignup", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    func buttonAction(){
        
        login()
        
    }
}


extension signInViewController{
    
    func buttonWork(){
        signInButton.layer.borderColor = UIColor.green.cgColor
        signInButton.layer.borderWidth = 2
        signInButton.layer.cornerRadius = 20
        
    }
    
    func login() {
        
        guard let email = loginEmailTextField.text else {
            print("email not found")
            return
        }
        guard let password = loginPassTextField.text else {
            print("password not found")
            return
        }
        
        print(email)
        print(password)
        
        let json: [String: Any] = ["username": "\(email)",
            "password": "\(password)"]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        guard let url = URL(string: "http://127.0.0.1:8000/api/v1/account/login") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data {
                do {
                    let responseModel = try JSONDecoder().decode(loginBase.self, from: data)
                    
                    self.tt = responseModel.token ?? ""
                    print("token is ", self.tt)
                    
                    
                    DispatchQueue.main.async {
                        
                        if responseModel.response == "successfullylogin"{
                            
                            self.defaults.set(true, forKey: "First Launch")
                            self.tokenSave.set(self.tt, forKey: "saveToken")
                            TokenUrl.shared.token = self.tt
                            
                            
                            
                            // self.performSegue(withIdentifier: "signintohome", sender: self)
                            
                            let vc = self.storyboard?.instantiateViewController(identifier: "MainViewController") as! MainViewController
                            self.navigationController?.pushViewController(vc, animated: false)
                        }else{
                            
                            print("error")
                        }
                        
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
