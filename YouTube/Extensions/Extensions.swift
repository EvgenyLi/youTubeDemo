//
//  Extensions.swift
//  YouTube
//
//  Created by Евгений Липадат on 29.04.2018.
//  Copyright © 2018 Евгений Липадат. All rights reserved.
//

import Foundation
import UIKit


let imgCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    func setupImage(imageUrl: String?) {
        guard let guardImageUrl = imageUrl else {return}
        self.image = imgCache.object(forKey: guardImageUrl as AnyObject) as? UIImage
        let imgUrl = URL(string: guardImageUrl)
        DispatchQueue.global().async {
            let imgData = try? Data(contentsOf: imgUrl!)
            guard imgData != nil else {return}
            let image = UIImage(data: imgData!)
            DispatchQueue.main.async {
                imgCache.setObject(image!, forKey: imageUrl as AnyObject)
                self.image = image
            }
        }
    }
}



