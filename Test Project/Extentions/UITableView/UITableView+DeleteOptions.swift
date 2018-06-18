//
//  UITableView+CellDelete.swift
//  SpyTalk
//
//  Created by Vadim Zhydenko on 4/28/18.
//  Copyright © 2018 Vadim Zhydenko. All rights reserved.
//

import UIKit

extension UITableView {
    
    func cellDelete(at indexPath: IndexPath, with animation: UITableViewRowAnimation = .fade) {
        cellsDelete(at: [indexPath], with: animation)
    }
    
    func cellsDelete(at indexPaths: [IndexPath], with animation: UITableViewRowAnimation = .fade) {
        beginUpdates()
        deleteRows(at: indexPaths, with: animation)
        endUpdates()
    }
    
    func sectionsDelete(_ indexSet: IndexSet, with animation: UITableViewRowAnimation = .fade) {
        beginUpdates()
        deleteSections(indexSet, with: animation)
        endUpdates()
    }
    
}
