//
//  ViewController.swift
//  PopApp
//
//  Created by Imanou on 29/04/2018.
//  Copyright © 2018 Imanou Petit. All rights reserved.
//

import UIKit

struct MenuCellViewModel {
    let title: String
    let performBlock: () -> Void
}

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var button: UIBarButtonItem!
    
    @IBAction func presentPopController(_ sender: UIBarButtonItem) {
        let a = MenuCellViewModel(title: "One", performBlock: { print("One") })
        let b = MenuCellViewModel(title: "Two", performBlock: { print("Two") })
        let cellViewModels = [a, b]
        let newViewController = MenuViewController(with: cellViewModels)
        newViewController.modalPresentationStyle = .popover
        
        let popPresentationController = newViewController.popoverPresentationController
        popPresentationController?.barButtonItem = button
        popPresentationController?.permittedArrowDirections = .any // Use UIPopoverArrowDirection(rawValue: 0) for no arrow
        popPresentationController?.delegate = self
        
        present(newViewController, animated: true, completion: nil)
    }
    
    // Use adaptivePresentationStyle(for controller:, traitCollection:) instead of adaptivePresentationStyle(for controller:)
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        // Prevent popover view controller to present in fullscreen mode for compact width / regular height
        // Prevent popover view controller to present centered for regular width / compact height
        return .none
    }
    
}
