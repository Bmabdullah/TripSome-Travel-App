//
//  PlacesTableViewCell.swift
//  TripSome
//
//  Created by AL Mustakim on 15/1/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit

class PlacesTableViewCell: UITableViewCell {

    @IBOutlet weak var placeImageView: UIImageView!
    
    @IBOutlet weak var placeNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    func configurePlaceData(with json:placesBase){
       // let imageURL = URL(string: "\(json.pimage ?? "")")
        //print(imageURL)
       // ImageService.downloadImage(url: imageURL!) { image in
            
           // self.placeImageView.image = image
       // }
        placeNameLabel.text = json.pname ?? ""
        print(json.pname ?? "")
        //totalPlaceLabel.text = json.
        
    }

}
