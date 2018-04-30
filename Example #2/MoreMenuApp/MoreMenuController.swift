//
//  MoreMenuController.swift
//  MoreMenuApp
//
//  Created by Imanou on 01/06/2018.
//  Copyright © 2018 Imanou Petit. All rights reserved.
//

import UIKit

struct Model {
    let thumbnailName: String
    let title: String
}

/**
 A modal view controller acting like an action sheet that displays options
 */
class GSMoreMenuController: UITableViewController {

    let models = [Model(thumbnailName: "Icon 1", title: "Icon 1"), Model(thumbnailName: "Icon 2", title: "Icon 2")]
    var observation: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.isScrollEnabled = false
        tableView.register(GSMoreMenuCell.self, forCellReuseIdentifier: GSMoreMenuCell.Constant.identifier)
        
        observation = tableView.observe(\.contentSize, options: [.new], changeHandler: { [unowned self] (tableView, contenSizeChange) in
            guard let contenSize = contenSizeChange.newValue else { return }
            self.preferredContentSize = CGSize(width: self.preferredContentSize.width, height: contenSize.height - 1)
        })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GSMoreMenuCell.Constant.identifier, for: indexPath) as! GSMoreMenuCell
        let model = models[indexPath.row]
        cell.titleLabel.text = model.title
        cell.thumbnailView.image = UIImage(named: model.thumbnailName)
        return cell
    }
    
}
