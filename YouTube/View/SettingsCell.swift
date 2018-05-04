//
//  SettingsCell.swift
//  YouTube
//
//  Created by Евгений Липадат on 29.04.2018.
//  Copyright © 2018 Евгений Липадат. All rights reserved.
//

import UIKit

class SettingsCell: UICollectionViewCell {
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? .darkGray : .white
            label.textColor = isHighlighted ? .white : .black
            img.tintColor = isHighlighted ? .white : .darkGray
        }
    }
    
    var settings: Settings? {
        didSet {
            label.text = settings?.name
            img.image = UIImage(named: (settings?.img)!)?.withRenderingMode(.alwaysTemplate)       }
    }
    
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let img: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: "settings")
        img.tintColor = UIColor.darkGray
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        addSubview(img)
        addSubview(label)
        img.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        img.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        img.widthAnchor.constraint(equalToConstant: 25).isActive = true
        img.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        label.leftAnchor.constraint(equalTo: img.rightAnchor, constant: 10).isActive = true
        label.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        label.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }
    
    
    
}
