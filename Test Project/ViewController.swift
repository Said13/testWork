//
//  ViewController.swift
//  Test Project
//
//  Created by Abdullah on 18.06.2018.
//  Copyright © 2018 Abdullah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var objects = [Exhibit]() { didSet{ tableView.reloadData() } }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ExhibitCell.self)
        getObjects()
    }
    
    func getObjects() {
        let t = FileExhibitsLoader.init()
        t.getExhibitList { (exhibits) in
            self.objects = exhibits
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.get(ExhibitCell.self)
        cell.config(object: objects[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


