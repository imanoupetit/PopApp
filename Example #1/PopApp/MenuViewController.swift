//
//  MenuViewController.swift
//  PopApp
//
//  Created by Imanou on 03/05/2018.
//  Copyright © 2018 Imanou Petit. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {
    
    let cellViewModels: [MenuCellViewModel]
    var observation: NSKeyValueObservation?
    
    init(with cellViewModels: [MenuCellViewModel]) {
        self.cellViewModels = cellViewModels
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isScrollEnabled = false
        tableView.separatorInset = .zero
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // Alternative: use `UIContentSizeCategoryDidChangeNotification`
        observation = tableView.observe(\.contentSize, options: [.initial, .new], changeHandler: { [unowned self] (tableView, contenSizeChange) in
            guard let contenSize = contenSizeChange.newValue else { return }
            self.preferredContentSize = CGSize(width: 240, height: contenSize.height - 1) // remove 1 pt so that the last separator is not visible
        })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = cellViewModels[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let performBlock = cellViewModels[indexPath.row].performBlock
        performBlock()
    }
    
}
