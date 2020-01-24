//
//  DetailsViewController.swift
//  TripSome
//
//  Created by AL Mustakim on 15/1/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var detailsImageView: UIImageView!
    
    var receved = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailsinformation()

        // Do any additional setup after loading the view.
    }
    
    func detailsinformation(){
        if receved == "Ahsan Monjil"{
            detailsImageView.image = #imageLiteral(resourceName: "Rectangle 17")
        }
        else{
            detailsImageView.image = #imageLiteral(resourceName: "Rectangle 19")
        }
    }
   
}
