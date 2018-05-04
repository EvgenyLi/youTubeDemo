//
//  VideoCell.swift
//  YouTube
//
//  Created by Евгений Липадат on 26.04.2018.
//  Copyright © 2018 Евгений Липадат. All rights reserved.
//

import UIKit

class VideoCell: UICollectionViewCell {
    
    var video: Video? {
        didSet {
            
            thumbnailImage.setupImage(imageUrl: video?.thumbnailImage)
            profilelImage.setupImage(imageUrl: video?.chanel?.profilelImage)
            videoName.text = video?.videoName
            guard let name = video?.chanel?.subTitle, let views = video?.numberOfViews else {return}
            let numberFormater = NumberFormatter()
            numberFormater.numberStyle = .decimal
            subTitle.text = "\(name) • \(String(describing: numberFormater.string(from: views)!)) • 2 years ago"
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        
        setupConstrains()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let thumbnailImage: UIImageView = {
       let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let profilelImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .gray
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let videoName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    let subTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.lightGray
        label.sizeToFit()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    
    func setupConstrains() {
        addSubview(thumbnailImage)
        addSubview(profilelImage)
        addSubview(videoName)
        addSubview(subTitle)
        
        thumbnailImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 15).isActive = true
        thumbnailImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -15).isActive = true
        thumbnailImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15).isActive = true
        thumbnailImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -70).isActive = true
        
        profilelImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 15).isActive = true
        profilelImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        profilelImage.topAnchor.constraint(equalTo: thumbnailImage.bottomAnchor, constant: 5).isActive = true
        profilelImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        videoName.leftAnchor.constraint(equalTo: profilelImage.rightAnchor, constant: 8).isActive = true
        videoName.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -15).isActive = true
        videoName.topAnchor.constraint(equalTo: thumbnailImage.bottomAnchor, constant: 5).isActive = true
        
        subTitle.leftAnchor.constraint(equalTo: profilelImage.rightAnchor, constant: 8).isActive = true
        subTitle.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -15).isActive = true
        subTitle.topAnchor.constraint(equalTo: videoName.bottomAnchor, constant: 4).isActive = true
    }
    
    
    
} // end



