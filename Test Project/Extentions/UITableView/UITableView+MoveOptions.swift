//
//  UITableView+Move.swift
//  SpyTalk
//
//  Created by Vadim Zhydenko on 4/25/18.
//  Copyright © 2018 Vadim Zhydenko. All rights reserved.
//

import UIKit

extension UITableView {
    
    func cellMove(from oldIndexPath: IndexPath, to newIndexPath: IndexPath) {
        guard oldIndexPath.section != newIndexPath.section || oldIndexPath.row != newIndexPath.row else { return }
        beginUpdates()
        moveRow(at: oldIndexPath, to: newIndexPath)
        endUpdates()
    }
    
}
