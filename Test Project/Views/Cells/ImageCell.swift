//
//  ImageCell.swift
//  Test Project
//
//  Created by Abdullah on 18.06.2018.
//  Copyright © 2018 Abdullah. All rights reserved.
//

import UIKit
import SDWebImage

class ImageCell: UICollectionViewCell {
    
    @IBOutlet private weak var image: UIImageView!

    func config(string: String) {
        image.sd_setImage(with: string.url, completed: nil)
    }
    
}
