//
//  UICollection+Custom.swift
//  SpyTalk
//
//  Created by Vadim Zhydenko on 3/19/18.
//  Copyright © 2018 Vadim Zhydenko. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func register<T>(_ classType: T.Type) {
        let desc = String(describing: T.self)
        let nib = UINib(nibName: desc, bundle: nil)
        register(nib, forCellWithReuseIdentifier: desc)
    }
    
    func get<T>(_ classType: T.Type, for indexPath: IndexPath ) -> T {
        let desc = String(describing: T.self)
        return dequeueReusableCell(withReuseIdentifier: desc, for: indexPath) as! T
    }
    
}
