//
//  UITableView+Visible last cells.swift
//  SpyTalk
//
//  Created by Vadim Zhydenko on 5/7/18.
//  Copyright © 2018 Vadim Zhydenko. All rights reserved.
//

import UIKit

extension UITableView {
    
    func isVisibleCells(last n: Int = 3) -> Bool {
        guard n <= 10 else { return false }
        guard let dataSource = self.dataSource else { return false }
        guard let sectionsCount = dataSource.numberOfSections?(in: self), sectionsCount > 0 else { return false }
        guard let visibleIndexPaths = indexPathsForVisibleRows else { return false }
        
        let maxSection = sectionsCount - 1
        var countToCheck = n
        var minSection = maxSection
        var rowInMinSection = dataSource.tableView(self, numberOfRowsInSection: maxSection)
        for section in stride(from: maxSection, through: 0, by: -1) {
            minSection = section
            let rows = dataSource.tableView(self, numberOfRowsInSection: section)
            if rows >= countToCheck {
                rowInMinSection = rows - countToCheck
                break
            } else { countToCheck = countToCheck - rows }
        }
        let minVisibleIndexPath = IndexPath(row: rowInMinSection, section: minSection)
        return visibleIndexPaths.contains(minVisibleIndexPath)
    }
    
}

