//
//  MoreMenuCell.swift
//  MoreMenuApp
//
//  Created by Imanou on 01/06/2018.
//  Copyright © 2018 Imanou Petit. All rights reserved.
//

import UIKit

class GSMoreMenuCell: UITableViewCell {
    
    struct Constant {
        static let identifier = "MoreMenuCell"
        static let width: CGFloat = 25

    }
    let thumbnailView = UIImageView()
    let titleLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabel.numberOfLines = 0
        
        thumbnailView.clipsToBounds = true
        thumbnailView.contentMode = .scaleAspectFit
        thumbnailView.translatesAutoresizingMaskIntoConstraints = false
        thumbnailView.widthAnchor.constraint(equalToConstant: Constant.width).isActive = true
        thumbnailView.heightAnchor.constraint(equalToConstant: Constant.width).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [thumbnailView, titleLabel])
        stackView.spacing = UIStackView.spacingUseSystem
        stackView.alignment = .center
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.layoutMarginsGuide.topAnchor.constraint(equalTo: stackView.topAnchor).isActive = true
        contentView.layoutMarginsGuide.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        contentView.layoutMarginsGuide.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        contentView.layoutMarginsGuide.bottomAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
