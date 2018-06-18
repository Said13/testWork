//
//  UITableView+UIRefreshControl.swift
//  SpyTalk
//
//  Created by Vadim Zhydenko on 4/28/18.
//  Copyright © 2018 Vadim Zhydenko. All rights reserved.
//

import UIKit

extension UITableView {
    
    func pullToRefresh(target: Any? = nil, with selector: Selector) -> UIRefreshControl {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(target, action: selector, for: .valueChanged)
        if #available(iOS 10.0, *) {
            self.refreshControl = refreshControl
        } else {
            addSubview(refreshControl)
        }
        return refreshControl
    }
    
}

