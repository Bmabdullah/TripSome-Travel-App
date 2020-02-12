//
//  ImageService.swift
//  TripSome
//
//  Created by AL Mustakim on 10/2/20.
//  Copyright © 2020 AL Mustakim. All rights reserved.
//

import UIKit

class ImageService {
    
    static func downloadImage(url: URL, completion: @escaping(_ image: UIImage?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, responseUrl, error in
            var downloadedImage: UIImage?
            
            if let data = data {
                downloadedImage = UIImage(data: data)
            }

            DispatchQueue.main.async {
                completion(downloadedImage)
            }
        }.resume()
    }
}
