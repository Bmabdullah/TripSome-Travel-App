//
//  signInViewController.swift
//  TripSome
//
//  Created by AL Mustakim on 23/1/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit

class signInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var loginEmailTextField: UITextField!
    @IBOutlet weak var loginPassTextField: UITextField!
    

    @IBAction func signInButton(_ sender: Any) {
        
        print("SIgned In Succesfully")
    }
    
    @IBAction func signUpPageButton(_ sender: Any) {
       // let vc = signUpViewController()
        //vc.
        performSegue(withIdentifier: "signintosignup", sender: self)
    }
    
}
