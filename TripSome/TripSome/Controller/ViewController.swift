//
//  ViewController.swift
//  TripSome
//
//  Created by AL Mustakim on 15/1/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    @IBOutlet var mainView: UIView!
    
    //humburger menu
    @IBOutlet weak var hiddenView: UIView!
    
    
    
    
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var sliderCollectionView: UICollectionView!
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
    var barishal = ["majar","tea garden","lakkatura hill","eco park","tanguar hawr","srimangal","lawachora"]
    
    
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
        
        // slider controll
        pageController.numberOfPages = imgArr.count
        pageController.currentPage = 0
        
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
    }
    
    
    
    
    //humburger menu
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer){
        if hiddenView.isHidden == false{
            hiddenView.isHidden = true
        }
    }

      

    @IBAction func tapNavButton(_ sender: Any) {
        
        if hiddenView.isHidden == true{
            hiddenView.isHidden = false
        }
        else{
            hiddenView.isHidden = true
        }
    }
    
    
    
   
    
    
    
    // function for image changing
    
    @objc func changeImage()
    {
        if counter < imgArr.count{
            let index = IndexPath.init(item: counter, section: 0)
            self.sliderCollectionView.scrollToItem(at: index , at: .centeredHorizontally, animated: true)
            pageController.currentPage = counter
            counter += 1
        }
        else{
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            pageController.currentPage = counter
        }
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if collectionView == sliderCollectionView{
            
            
            let noOfCellsInRow = 1

            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

            let totalSpace = flowLayout.sectionInset.left
                + flowLayout.sectionInset.right
                + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

            let size = Int((sliderCollectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))

            return CGSize(width: size, height: size)

        }
        else{
            let noOfCellsInRow = 2

            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

            let totalSpace = flowLayout.sectionInset.left
                + flowLayout.sectionInset.right
                + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

            let size = Int((divitionCOllectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
            let hsize = Int((divitionCOllectionView.bounds.height - totalSpace) / 4)

            return CGSize(width: size, height: hsize)

        }

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
        //sendinng data to first collection view
        
        
        if collectionView == sliderCollectionView{
            let cell = sliderCollectionView.dequeueReusableCell(withReuseIdentifier:"SliderCollectionViewCell", for: indexPath) as! SliderCollectionViewCell
            cell.sliderImageView.image = imgArr[indexPath.row]
            
            return cell
        }
            // sending onto 2nd collectionview
        else{
            let cell = divitionCOllectionView.dequeueReusableCell(withReuseIdentifier:"DivitionCollectionViewCell", for: indexPath) as! DivitionCollectionViewCell
            cell.divitionImageView.image = imgArr[indexPath.row]
            cell.divitionNameLabel.text = divNameArr[indexPath.row]
            //    cell.totalPlaceLabel.text = "\(divNameArr[indexPath.row].count) Places > "
            cell.contentView.layer.cornerRadius = 10
            
            
            if indexPath.row == 0 {
                cell.totalPlaceLabel.text = "\(barishal.count) Places > "
            }
            if indexPath.row == 1 {
                cell.totalPlaceLabel.text = "\(chittagonj.count) Places > "
            }
            if indexPath.row == 2 {
                cell.totalPlaceLabel.text = "\(dhaka.count) Places > "
            }
            if indexPath.row == 3 {
                cell.totalPlaceLabel.text = "\(khulna.count) Places > "
            }
            if indexPath.row == 4 {
                cell.totalPlaceLabel.text = "\(rajshahi.count) Places > "
            }
            if indexPath.row == 5 {
                cell.totalPlaceLabel.text = "\(sylhet.count) Places > "
            }
            if indexPath.row == 6 {
                cell.totalPlaceLabel.text = "\(rangpur.count) Places > "
            }
            if indexPath.row == 7 {
                cell.totalPlaceLabel.text = "\(mymensingh.count) Places > "
            }
            return cell
        }
    }

}



