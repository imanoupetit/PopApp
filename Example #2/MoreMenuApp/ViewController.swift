//
//  ViewController.swift
//  MoreMenuApp
//
//  Created by Imanou on 01/06/2018.
//  Copyright © 2018 Imanou Petit. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    lazy var buttonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.edit, target: self, action: #selector(showMoreMenu))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = buttonItem
    }

    @objc func showMoreMenu(_ sender: UIBarButtonItem) {
        let moreMenuViewController = GSMoreMenuController()
        moreMenuViewController.modalPresentationStyle = .popover
        let popPresentationController = moreMenuViewController.popoverPresentationController
        popPresentationController?.barButtonItem = buttonItem
        popPresentationController?.permittedArrowDirections = .any
        popPresentationController?.delegate = self
        navigationController?.present(moreMenuViewController, animated: true, completion: nil)
    }

    // MARK: - UIPopoverPresentationControllerDelegate
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        // Prevent popover view controller to present in fullscreen mode for compact width / regular height
        // Prevent popover view controller to present centered for regular width / compact height
        return .none
    }
    
}
