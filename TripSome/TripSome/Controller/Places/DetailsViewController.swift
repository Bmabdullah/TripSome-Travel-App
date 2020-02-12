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
    @IBOutlet weak var detailsNameLabel: UILabel!
    @IBOutlet weak var pLocation: UILabel!
    
    @IBOutlet weak var pIntro: UILabel!
    
    @IBOutlet weak var pHistory: UILabel!
    
    var placeimage = UIImage()
    var name = ""
    var location = ""
    var intro = ""
    var history = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        detailsinformation()
        
        print(name)
        print(location)
        print(intro)
        print(history)

        // Do any additional setup after loading the view.
    }
    
    func detailsinformation(){
        
        detailsImageView.image = placeimage
        pLocation.text = location
        pIntro.text = intro
        pHistory.text = history
//        if receved == "Ahsan Monjil"{
//            detailsImageView.image = #imageLiteral(resourceName: "Rectangle 17")
//        }
//        else{
//            detailsImageView.image = #imageLiteral(resourceName: "Rectangle 19")
//        }
    }
   
}
