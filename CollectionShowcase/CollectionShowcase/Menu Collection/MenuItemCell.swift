//
//  MenuItemCell.swift
//  CollectionShowcase
//
//  Created by dede.exe on 13/02/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import UIKit

class MenuItemCell: UICollectionViewCell {
    
    static var identifier : String = "MenuItemCell"
    
    private let highlightColor = UIColor(red: 1/255, green: 163/255, blue: 0/255, alpha: 1)
    private let normalColor = UIColor.white
    
    @IBOutlet weak var textLabel : UILabel!
    @IBOutlet weak var containerView : UIView!

    override var isSelected: Bool {
        didSet {
            if isSelected {
                styleSelected()
                return
            }
            
            styleDeselected()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        styleDeselected()
        textLabel.text = nil
    }
    
    // MARK: - Helpers
    
    private func setup() {
        containerView.layer.cornerRadius = 8.0
        containerView.layer.borderWidth = 1.0
        styleDeselected()
    }

    private func styleSelected() {
        textLabel.textColor = normalColor
        containerView.backgroundColor = highlightColor
        containerView.layer.borderColor = normalColor.cgColor
    }
    
    private func styleDeselected() {
        textLabel.textColor = highlightColor
        containerView.backgroundColor = normalColor
        containerView.layer.borderColor = highlightColor.cgColor
    }
    
}
