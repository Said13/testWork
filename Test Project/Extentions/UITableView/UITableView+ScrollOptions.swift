//
//  UITableView+ScrollOptions.swift
//  SpyTalk
//
//  Created by Vadim Zhydenko on 4/28/18.
//  Copyright © 2018 Vadim Zhydenko. All rights reserved.
//

import UIKit

extension UITableView {
    
    func scrollToMaxContentOffset(animated: Bool = true) {
        let tableViewContentHeight = contentSize.height
        let visibleRect = CGRect(x: 0, y: tableViewContentHeight - 1, width: 1, height: 1)
        scrollRectToVisible(visibleRect, animated: animated)
    }
    
    func scrollToLastIndexPath(toPosition position: UITableViewScrollPosition = .bottom, animated: Bool = true) {
        guard let dataSourceOk = dataSource, let lastSection = dataSourceOk.numberOfSections?(in: self)
            else { return }
        let rows = dataSourceOk.tableView(self, numberOfRowsInSection: lastSection - 1)
        guard rows > 0, visibleCells.count > 0  else { return }
        DispatchQueue.main.async {
            self.scrollToRow(at: IndexPath(row: rows - 1, section: lastSection - 1), at: position, animated: animated)
        }
    }
    
    func reloadDataAndKeepOffset() {
        DispatchQueue.main.async {
            self.setContentOffset(.zero, animated: false)
            
            let beforeContentSize = self.contentSize
            self.reloadData()
            self.layoutIfNeeded()

            let newOffset = CGPoint(x: 0, y: self.contentSize.height - beforeContentSize.height)

            self.setContentOffset(newOffset, animated: false)
        }
    }
    
    func reloadDataAndScrollBottom(animated: Bool) {
        reloadData()
        scrollToMaxContentOffset(animated: animated)
    }
    
    func reloadDataAndScrollLastIndexPath(animated: Bool) {
        reloadData()
        scrollToLastIndexPath(animated: animated)
    }
    
    func scrollToLastIndexPathIfVisibleCells(last n: Int = 3, afterDelayOf delay: TimeInterval = 0.3) {
        guard self.isVisibleCells(last: n) else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.scrollToLastIndexPath()
        }
    }
    
    func scrollIfVisibleCells(last n: Int = 3, to indexPath: IndexPath, afterDelayOf delay: TimeInterval = 0.3, position: UITableViewScrollPosition = .bottom, animated: Bool = true) {
        guard self.isVisibleCells(last: n) else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            DispatchQueue.main.async { // is needed???
                self.scrollToRow(at: indexPath, at: position, animated: animated)
            }
        }
    }
    
}
