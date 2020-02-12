//
//  DivitionCollectionViewCell.swift
//  TripSome
//
//  Created by AL Mustakim on 15/1/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit

class DivitionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var divitionImageView: UIImageView!
    @IBOutlet weak var divitionNameLabel: UILabel!
    @IBOutlet weak var totalPlaceLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    
    
    func configuredivitionData(with json:DivitionBase){
        let imageURL = URL(string: "\(json.divimage ?? "")")
        //print(imageURL)
        ImageService.downloadImage(url: imageURL!) { image in
            
            self.divitionImageView.image = image
        }
        divitionNameLabel.text = json.divname ?? ""
        print(json.divname ?? "")
        //totalPlaceLabel.text = json.
        
    }

    
}
