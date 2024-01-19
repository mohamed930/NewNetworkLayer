//
//  UIImageView.swift
//  testConnection
//
//  Created by Mohamed Ali on 19/01/2024.
//

import Foundation
import SDWebImage

extension UIImageView {
    
    var placeholderImage: String {
        return "loading image"
    }
    
    var errorInConnection: String {
        return "ErrorConnection"
    }
    
    func loadImageFromServer(_ url: String, placeHolderName: String = "loading image") {
        
        let newUrl = url.trimmingCharacters(in: .whitespaces)
        
        guard let url = URL(string: newUrl) else {
            self.image = UIImage(named: errorInConnection)
            return
        }
        
        // Use SDWebImage to load and cache the image
        let placeHolderImage = UIImage(named: placeHolderName)
        self.sd_setImage(with: url, placeholderImage: placeHolderImage, options: [.refreshCached, .continueInBackground,.transformAnimatedImage]) { [weak self] (image, error, cacheType, imageURL) in
            guard let self = self else { return }
            
            // Handle completion if needed
            if error != nil {
                // Handle error
                self.image = UIImage(named: self.errorInConnection)
            }
        }
        
    }
    
}
