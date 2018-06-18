//
//  UITableView+CellInsert.swift
//  SpyTalk
//
//  Created by Vadim Zhydenko on 4/28/18.
//  Copyright © 2018 Vadim Zhydenko. All rights reserved.
//

import UIKit

extension UITableView {
    
    func insertCell(at indexPath: IndexPath, with animation: UITableViewRowAnimation = .automatic) {
        insertCells(at: [indexPath], with: animation)
    }
    
    func insertCells(at indexPaths: [IndexPath], with animation: UITableViewRowAnimation = .automatic) {
        beginUpdates()
        insertRows(at: indexPaths, with: animation)
        endUpdates()
    }
    
    func insertCellBottom(with animation: UITableViewRowAnimation = .fade) {
        guard let dataSourceOk = dataSource else { return }
        guard let sections = dataSourceOk.numberOfSections?(in: self) else { return }
        let rows = dataSourceOk.tableView(self, numberOfRowsInSection: sections - 1)
        guard rows > 0 else { return }
        insertCell(at: IndexPath(row: rows - 1, section: sections - 1), with: animation)
    }
    
    func insertSectionBottom(with animation: UITableViewRowAnimation = .fade) {
        guard let dataSourceOk = dataSource else { return }
        guard let sections = dataSourceOk.numberOfSections?(in: self) else { return }
        let sectionIndex = IndexSet(integer: sections - 1)
        self.beginUpdates()
        insertSections(sectionIndex, with: animation)
        self.endUpdates()
    }

    func insert(_ sections: IndexSet = IndexSet(), _ rows: [IndexPath] = [], with animation: UITableViewRowAnimation = .automatic) {
        self.beginUpdates()
        if rows.count > 0 { insertRows(at: rows, with: animation) }
        if sections.count > 0 { insertSections(sections, with: animation) }
        self.endUpdates()
    }
    
    func insert(_ newSections: Int, _ newRows: Int, with animation: UITableViewRowAnimation = .automatic) {
        guard let dataSource = dataSource, let sections = dataSource.numberOfSections?(in: self) else { return }
        let section = sections - 1
        let rows = dataSource.tableView(self, numberOfRowsInSection: section) - 1
        DispatchQueue.main.async {
            self.beginUpdates()
            if newSections > 0 { self.insertSections(IndexSet(integer: section), with: animation) }
            if newRows > 0 { self.insertRows(at: [IndexPath(row: rows, section: section)], with: animation) }
            self.endUpdates()
        }
    }
    
}
