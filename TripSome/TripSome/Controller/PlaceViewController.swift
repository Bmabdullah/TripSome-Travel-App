//
//  PlaceViewController.swift
//  TripSome
//
//  Created by AL Mustakim on 15/1/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit

class PlaceViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var divLabel: UILabel!
    
    @IBOutlet weak var placeTableView: UITableView!
    
    var receved = ""

    var dhkArr = ["Ahsan Monjil","lebaration war museum","National Assembly","lalbagh fort","National Zoo"]
    var dhkImgArr = [#imageLiteral(resourceName: "Rectangle 13"),#imageLiteral(resourceName: "Rectangle 16"),#imageLiteral(resourceName: "Rectangle 14"),#imageLiteral(resourceName: "Rectangle 11"),#imageLiteral(resourceName: "Rectangle 17")]
    
    
    
    var dflt = ["defualt"]
    var dfltImg = [#imageLiteral(resourceName: "Rectangle 10")]
    
    var arr : [ String ] = []
    var imgArr : [ UIImage ] = []
    
 
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        placeTableView.delegate = self
        placeTableView.dataSource = self
        
        arrayChange()
        
    
    }
    
    func arrayChange(){
        if receved == "Dhaka"{
            arr = dhkArr
            imgArr = dhkImgArr
            
        }
        else{
            arr = dflt
            imgArr = dfltImg
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        
        arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = placeTableView.dequeueReusableCell(withIdentifier: "PlacesTableViewCell", for: indexPath) as! PlacesTableViewCell
        
        cell.placeNameLabel.text = arr[indexPath.row]
            cell.placeImageView.image = imgArr[indexPath.row]
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
         
         self.navigationController?.pushViewController(vc, animated: true)
        vc.receved = arr[indexPath.row]
    }


}
