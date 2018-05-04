//
//  MenuBar.swift
//  YouTube
//
//  Created by Евгений Липадат on 26.04.2018.
//  Copyright © 2018 Евгений Липадат. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(MenuCell.self, forCellWithReuseIdentifier: "cell")
        cv.backgroundColor = UIColor(red: 230/255, green: 32/255, blue: 32/255, alpha: 1)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    let horizontalLineView = UIView()
    var horizontalLineLeftConstreint: NSLayoutConstraint?
    let imageNames = ["home", "trending", "subscriptions", "account"]

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupHorizontalLine()
        // first item will be white
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .centeredHorizontally)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MenuCell
        cell.imageView.image = UIImage(named: imageNames[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        cell.tintColor = UIColor(red: 91/255, green: 14/255, blue: 13/255, alpha: 1)
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width / 4, height: self.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let x = CGFloat(indexPath.item) * frame.width / 4
        horizontalLineLeftConstreint?.constant = x
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupHorizontalLine() {
        
        horizontalLineView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        horizontalLineView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupLayout() {
        addSubview(collectionView)
        addSubview(horizontalLineView)
        collectionView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        horizontalLineLeftConstreint = horizontalLineView.leftAnchor.constraint(equalTo: self.leftAnchor)
        horizontalLineLeftConstreint?.isActive = true
        horizontalLineView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horizontalLineView.heightAnchor.constraint(equalToConstant: 4).isActive = true
        horizontalLineView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4).isActive = true
        
    }
    
    
    
    
} // end
