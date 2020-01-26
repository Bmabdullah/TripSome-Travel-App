//
//  signUpViewController.swift
//  TripSome
//
//  Created by AL Mustakim on 26/1/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit

class signUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        buttonwork()
    }

    @IBOutlet weak var signUpButton: UIButton!
    

   
    @IBAction func signInPageButton(_ sender: Any) {
        
        performSegue(withIdentifier: "signuptosignin", sender: self)
    }
    
    func buttonwork(){
        signUpButton.layer.borderColor = UIColor.green.cgColor
        signUpButton.layer.borderWidth = 2
        signUpButton.layer.cornerRadius = 30
    }
    
}
