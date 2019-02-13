//
//  ViewController.swift
//  CollectionShowcase
//
//  Created by dede.exe on 13/02/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var menuCollection : MenuCollectionView!
    
    let items : [String] = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6", "Item 7", "Item 8", "Item 9", "Item 10", "Item 11"]

    override func viewDidLoad() {
        super.viewDidLoad()
        menuCollection.menuDelegate = self
        menuCollection.items = items
    }

}


extension ViewController : MenuCollectionViewDelegate {
    func menuCollectionView(_ menu: MenuCollectionView, didSelectItemAt index: Int) {
        print("Selecionei ítem #\(index), com título '\(items[index])'")
    }
}

