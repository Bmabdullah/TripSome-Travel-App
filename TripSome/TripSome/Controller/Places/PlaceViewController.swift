//
//  PlaceViewController.swift
//  TripSome
//
//  Created by AL Mustakim on 15/1/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit

class PlaceViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var arrayPlaces = [placesBase]()
    
    @IBOutlet weak var placeTableView: UITableView!
    
    var receved = ""

    var dhkArr = ["Ahsan Monjil","lebaration war museum","National Assembly","lalbagh fort","National Zoo"]
    var dhkImgArr = [#imageLiteral(resourceName: "Rectangle 13"),#imageLiteral(resourceName: "Rectangle 16"),#imageLiteral(resourceName: "Rectangle 14"),#imageLiteral(resourceName: "Rectangle 11"),#imageLiteral(resourceName: "Rectangle 17")]

    var dflt = ["defualt"]
    var dfltImg = [#imageLiteral(resourceName: "Rectangle 10")]
    
    var arr : [ String ] = []
    var imgArr : [ UIImage ] = []
    
    var iscolupse = false
    var selectedIndex = -1
    
    var tableIndexforColor : Int = 0
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        placeTableView.delegate = self
        placeTableView.dataSource = self
        
       // arrayChange()
        
        //placeTableView.estimatedRowHeight = 500
       // placeTableView.rowHeight = UITableView.automaticDimension
        self.navigationItem.title = "\(receved)"
        
        getPlaceName()
    
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

        
        arrayPlaces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = placeTableView.dequeueReusableCell(withIdentifier: "PlacesTableViewCell", for: indexPath) as! PlacesTableViewCell
        
        
        cell.configurePlaceData(with: self.arrayPlaces[indexPath.row])
//
//        cell.placeNameLabel.text = arr[indexPath.row]
//            cell.placeImageView.image = imgArr[indexPath.row]
//
        tableIndexforColor = Int(indexPath.row)
        if tableIndexforColor % 2 == 0{
            cell.layer.backgroundColor = UIColor.lightText.cgColor
        }
        else{
            cell.layer.backgroundColor = UIColor.lightGray.cgColor
        }
        
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if  self.selectedIndex == indexPath.row && self.iscolupse == true {
                   
                       return 235
                   }
              
                   else{
                       
                       return 58
                   }
    }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
               tableView.deselectRow(at: indexPath, animated: true)
        
               if selectedIndex != indexPath.row{
                   self.iscolupse = true
                print(1)
               }
               else{
                   self.iscolupse = true
//                        let vc = storyboard?.instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
                
                        let vc = storyboard?.instantiateViewController(identifier: "placeDetailsTableViewController") as! placeDetailsTableViewController
                self.navigationController?.pushViewController(vc, animated: false)
                
                vc.name = arrayPlaces[indexPath.row].pname ?? ""
                vc.location = arrayPlaces[indexPath.row].plocation ?? ""
                vc.intro = arrayPlaces[indexPath.row].pinfo ?? ""
                vc.history = arrayPlaces[indexPath.row].phistory ?? ""
                
               }
               self.selectedIndex = indexPath.row
               tableView.reloadRows(at: [indexPath], with: .automatic)
           }


}

extension PlaceViewController{
    func getPlaceName(){
      //  let token = "3790d5bf65170dccbd1a3bc2669925d6bd2072ae"
        
        guard let url = URL(string: "http://127.0.0.1:8000/palces/api/v1/list") else { return }
        var request = URLRequest(url: url)
        
        //request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("token \(TokenUrl.shared.token)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        //request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let allData = data {
          
                do {
                    let responseModel = try? JSONDecoder().decode([placesBase].self, from: allData)
                   
                    print(responseModel)
                    
                    
                    DispatchQueue.main.async {
                        
                      
                        for response in responseModel!{
                            self.arrayPlaces.append(response)
                        }
                      
                    self.placeTableView.reloadData()
                    }
                    
                }
                catch {
                    print(error.localizedDescription)
                    return
                }
                
                
                
            }
                          
        }.resume()
        
        
    }
}
