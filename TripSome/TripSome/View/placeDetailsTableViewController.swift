//
//  placeDetailsTableViewController.swift
//  TripSome
//
//  Created by AL Mustakim on 11/2/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit

class placeDetailsTableViewController: UITableViewController {

    
    
    var placeimage = UIImage()
    var name = ""
    var location = ""
    var intro = ""
    var history = ""
    var imarr = [placesBase]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        placeImageView.image = placeimage
        pLocation.text = location
        pintro.text = intro
        phistory.text = history
        
        
        print(placeimage)
        print(location)
        print(intro)
        print(history)
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var pintro: UILabel!
    @IBOutlet weak var phistory: UILabel!
    
    @IBOutlet weak var pLocation: UILabel!
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return 1
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func configuredivitionData(with url:String){
        let imageURL = URL(string: url)
        //print(imageURL)
        ImageService.downloadImage(url: imageURL!) { image in
            
            self.placeImageView.image = image
        } 
    }
}
