//
//  MenuCollectionView.swift
//  CollectionShowcase
//
//  Created by dede.exe on 13/02/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import UIKit

protocol MenuCollectionViewDelegate : class {
    func menuCollectionView(_ menu:MenuCollectionView, didSelectItemAt index:Int)
}

class MenuCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private var selectedIndex = -1 {
        didSet { update() }
    }
    
    var items : [String] = [] {
        didSet { update() }
    }
    
    weak var menuDelegate : MenuCollectionViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    //MARK: - CollectionView Datasource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: MenuItemCell.identifier, for: indexPath) as? MenuItemCell else {
            fatalError("Fail to load cell")
        }
        
        let title = items[indexPath.row]
        cell.textLabel.text = title
        
        if selectedIndex == indexPath.row {
            cell.isSelected = true
        }
        
        return cell
    }
    
    //MARK: - CollectionView Delegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        menuDelegate?.menuCollectionView(self, didSelectItemAt: selectedIndex)
    }
    
    //MARK: - UICollectionView Delegate FlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: self.frame.height - 10)
    }
    
    //MARK: - Helpers
    
    func setup() {
        delegate = self
        dataSource = self
        isScrollEnabled = true
        showsHorizontalScrollIndicator = false
        
        if let flowLayout = self.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumInteritemSpacing = 8.0
        }
        
        registeCell()
    }
    
    private func registeCell() {
        let nib = UINib(nibName: MenuItemCell.identifier, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: MenuItemCell.identifier)
    }
    
    func update() {
        if !Thread.isMainThread {
            DispatchQueue.main.async { [weak self] in
                guard let myself = self else { return }
                myself.update()
            }
        }
        
        self.reloadData()
    }
    
}
