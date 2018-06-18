//
//  ExhibitCell.swift
//  Test Project
//
//  Created by Abdullah on 18.06.2018.
//  Copyright © 2018 Abdullah. All rights reserved.
//

import UIKit

class ExhibitCell: UITableViewCell {

    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var object = Exhibit()
    
    func config(object: Exhibit) {
        self.object = object
        self.title.text = object.title
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ImageCell.self)
        collectionView.backgroundColor = UIColor.clear
    }
    
}

extension ExhibitCell: UICollectionViewDelegate, UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {

        return object.images!.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.get(ImageCell.self, for: indexPath)
        cell.config(string: object.images![indexPath.row])

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat(self.frame.width), height: self.frame.height)
    }
}

