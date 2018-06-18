//
//  UITableView+DeleteInsertOptions.swift
//  SpyTalk
//
//  Created by Abdullah on 23.05.2018.
//  Copyright © 2018 Vadim Zhydenko. All rights reserved.
//

import UIKit

extension UITableView {
    
    func cellsDeleteAndInsert(toDelete indexPathsDelete: [IndexPath],
                              toInsert indexPathsInsert: [IndexPath],
                              with animation: UITableViewRowAnimation = .automatic) {
        beginUpdates()
        deleteRows(at: indexPathsDelete, with: .automatic)
        insertRows(at: indexPathsInsert, with: .automatic)
        endUpdates()
    }
    
}
