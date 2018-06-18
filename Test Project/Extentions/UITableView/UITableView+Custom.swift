//
//  UITableView+Custom.swift
//  SpyTalk
//
//  Created by Vadim Zhydenko on 3/5/18.
//  Copyright © 2018 Vadim Zhydenko. All rights reserved.
//

import UIKit

extension UITableView {
    
    func register<T>(_ classType: T.Type) {
        let desc = String(describing: T.self)
        let nib = UINib(nibName: desc, bundle: nil)
        register(nib, forCellReuseIdentifier: desc)
    }
    
    func get<T>(_ classType: T.Type) -> T {
        let desc = String(describing: T.self)
        guard let cell = dequeueReusableCell(withIdentifier: desc) as? T
            else { fatalError("Could not deque cell with type \(T.self)") }
        return cell
    }
    
    func get<T>(_ classType: T.Type, for indexPath: IndexPath) -> T {
        let desc = String(describing: T.self)
        guard let cell = dequeueReusableCell(withIdentifier: desc, for: indexPath) as? T
            else { fatalError("Could not deque cell with type \(T.self)") }
        return cell
    }
    
    
    func cellAutoHeightConfig() {
        estimatedRowHeight = 0
        estimatedSectionHeaderHeight = 0
        estimatedSectionFooterHeight = 0
        rowHeight = UITableViewAutomaticDimension
    }
    
    func clearSelection(animated: Bool = true) {
        guard let indexPathsToDeselect = indexPathsForSelectedRows else { return }
        indexPathsToDeselect.forEach { deselectRow(at: $0, animated: animated) }
    }
    
}
