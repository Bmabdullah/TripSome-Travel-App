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
    
    // page control
    
    @IBOutlet weak var divitionCOllectionView: UICollectionView!
    
    // Variables
    var imgArr = [#imageLiteral(resourceName: "Rectangle 19"),#imageLiteral(resourceName: "Rectangle 14"),#imageLiteral(resourceName: "Rectangle 15"),#imageLiteral(resourceName: "Rectangle 14"),#imageLiteral(resourceName: "Rectangle 18"),#imageLiteral(resourceName: "Rectangle 11"),#imageLiteral(resourceName: "Rectangle 17"),#imageLiteral(resourceName: "Rectangle 13")]
    var divNameArr = ["Barishal","Chittagong","Dhaka","Khulna","Rajshahi","Sylhet","Rangpur","Mymensingh"]      // array for divition name label
    // divition wise global array
    
    var dhaka = ["ahsan monjil","sonarga","jatiyo songsodh","zoo","savar"]
    var sylhet = ["majar","tea garden","lakkatura hill","eco park","tanguar hawr","srimangal","lawachora"]
    var rangpur = ["ahsan monjil","sonarga","jatiyo songsodh","zoo","savar"]
    var chittagonj = ["majar","tea garden","lakkatura hill","eco park","tanguar hawr","srimangal","lawachora"]
    var mymensingh = ["ahsan monjil","sonarga","jatiyo songsodh","zoo","savar"]
    var rajshahi = ["majar","tea garden","lakkatura hill","eco park","tanguar hawr","srimangal","lawachora"]
    var khulna = ["ahsan monjil","sonarga","jatiyo songsodh","zoo","savar"]
    var barishal:[String] = ["majar","tea garden", "jfdhg"]
    
    var divitionCounter = ["7","5","6","3","10","20","10","5"]
    
    // variables for counter
    var timer = Timer()
    var counter = 0
    var index = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //humburger menu
        hiddenView.isHidden = true
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        leftSwipe.direction = .left
        mainView.addGestureRecognizer(leftSwipe)
        
        //side menu function call
        sideMenu()
        navigationDesign()
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
        return imgArr.count
    }
    
    
    // collectionview selected item
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        if collectionView == divitionCOllectionView{
            let vc = storyboard?.instantiateViewController(identifier: "PlaceViewController") as! PlaceViewController
            
            self.navigationController?.pushViewController(vc, animated: true)
            vc.receved = divNameArr[indexPath.row]
        }
        
    }
    
    
    //cell data sending in collectionview
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var mycustomCell = UICollectionViewCell()
        
        let cell:DivitionCollectionViewCell = divitionCOllectionView.dequeueReusableCell(withReuseIdentifier:"DivitionCollectionViewCell", for: indexPath) as! DivitionCollectionViewCell
        // cell.divisionCollectionCellConfigure(with modelobj[indexPath.row])
        cell.divitionImageView.image = imgArr[indexPath.row]
        cell.divitionNameLabel.text = divNameArr[indexPath.row]
        //    cell.totalPlaceLabel.text = "\(divNameArr[indexPath.row].count) Places > "
        cell.contentView.layer.cornerRadius = 10
        
        
        cell.totalPlaceLabel.text = "\(divitionCounter[indexPath.row]) Places > "
        
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
        visitedPlaceButton.layer.borderColor = UIColor.red.cgColor
        visitedPlaceButton.layer.borderWidth = 2
    }
    func navigationDesign(){
        navigationController?.navigationBar.barTintColor = UIColor.systemGreen
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
    }
    
    
    
    let defaults = UserDefaults.standard
    
    @IBAction func signOutButton(_ sender: Any) {
        
        //navigationController?.popToRootViewController(animated: true)
        //signInViewController()
        self.dismiss(animated: false, completion: nil)
        
        defaults.set(false, forKey: "First Launch")
        performSegue(withIdentifier: "signOut", sender: self)
        
        print("Logged Out")
        
    }
    
}



