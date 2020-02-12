//
//  ViewController.swift
//  TripSome
//
//  Created by AL Mustakim on 15/1/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    @IBOutlet var mainView: UIView!
    var window: UIWindow?
    
    //humburger menu
    @IBOutlet weak var hiddenView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sloganLabel: UILabel!
    
    @IBOutlet weak var bangladeshButton: UIButton!
    @IBOutlet weak var visitedPlaceButton: UIButton!
    @IBOutlet weak var travelTipsButton: UIButton!
    
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var privecyButton: UIButton!
    @IBOutlet weak var conditionButton: UIButton!
    
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!
    @IBOutlet weak var signOutButton: UIButton!
    
    @IBOutlet weak var divitionCOllectionView: UICollectionView!
    
    
    //var datajson = [LoginRequestModel]()
    var array_divition = [DivitionBase]()
    var t = TokenUrl()
    
 
    
    var divitionCounter = ["7","5","6","3","10","20","10","5"]
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.setNavigationBarHidden(false, animated: true)
        //humburger menu
        hiddenView.isHidden = true
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        leftSwipe.direction = .left
        mainView.addGestureRecognizer(leftSwipe)
        
        //side menu function call
        sideMenu()
        navigationDesign()
        getdivitionname()
        
    }
    
    
    @IBAction func tapNavButton(_ sender: Any) {
        
        if hiddenView.isHidden == true{
            hiddenView.isHidden = false
        }
        else{
            hiddenView.isHidden = true
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let noOfCellsInRow = 2
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
        
        let size = Int((divitionCOllectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        let hsize = Int((divitionCOllectionView.bounds.height - totalSpace) / 4)
        
        return CGSize(width: size, height: hsize)
        
    }
    
    //number of item in collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array_divition.count
    }
    
    // collectionview selected item
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
            let vc = storyboard?.instantiateViewController(identifier: "PlaceViewController") as! PlaceViewController
            
            self.navigationController?.pushViewController(vc, animated: true)
        vc.receved = array_divition[indexPath.row].divname ?? ""
       
        
    }
    
    
    //cell data sending in collectionview
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var mycustomCell = UICollectionViewCell()
        
        let cell:DivitionCollectionViewCell = divitionCOllectionView.dequeueReusableCell(withReuseIdentifier:"DivitionCollectionViewCell", for: indexPath) as! DivitionCollectionViewCell
 
            cell.configuredivitionData(with: self.array_divition[indexPath.row])
     
        cell.totalPlaceLabel.text = "\(divitionCounter[indexPath.row].count) Places > "
        cell.contentView.layer.cornerRadius = 10
        
        
        //cell.totalPlaceLabel.text = "\(divitionCounter[indexPath.row]) Places > "
      //  divitionCOllectionView.reloadData()
        
        mycustomCell = cell
        return mycustomCell
        
        
    }
    
    
    
    //humburger menu swipe out function
    @objc func handleSwipe(sender: UISwipeGestureRecognizer){
        if hiddenView.isHidden == false{
            hiddenView.isHidden = true
        }
    }
    
    // side menu function
    func sideMenu(){
        profileImageView.layer.cornerRadius = 60
        bangladeshButton.layer.cornerRadius = 20
        //        visitedPlaceButton.layer.borderColor = UIColor.red.cgColor
        //        visitedPlaceButton.layer.borderWidth = 2
    }
    func navigationDesign(){
        navigationController?.navigationBar.barTintColor = UIColor.systemGreen
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
    }
    
    
    
    let defaults = UserDefaults.standard
    
    @IBAction func signOutButton(_ sender: Any) {
        
        self.dismiss(animated: false, completion: nil)
        
        defaults.set(false, forKey: "First Launch")
        
        // performSegue(withIdentifier: "signOut", sender: self)
        
        let vc = self.storyboard?.instantiateViewController(identifier: "signInViewController") as! signInViewController
        self.navigationController?.pushViewController(vc, animated: false)
        
        print("Logged Out")
        
    }
    
}

extension MainViewController{
    
    func getdivitionname(){
        
       // let token = "3790d5bf65170dccbd1a3bc2669925d6bd2072ae"
        
        guard let url = URL(string: "http://127.0.0.1:8000/division_data/api/v1/onlylist") else { return }
        var request = URLRequest(url: url)
        
        //request.setValue("application/json", forHTTPHeaderField: "Content-Type")
      // request.addValue("token 3790d5bf65170dccbd1a3bc2669925d6bd2072ae", forHTTPHeaderField: "Authorization")
        request.addValue("token \(TokenUrl.shared.token)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        //request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let allData = data {
                do {
                    let responseModel = try? JSONDecoder().decode([DivitionBase].self, from: allData)
    
                    DispatchQueue.main.async {
                        
                      
                        for response in responseModel!{
                            self.array_divition.append(response)
                        }
                      
                     self.divitionCOllectionView.reloadData()
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





