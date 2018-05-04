//
//  SettingsLaunchController.swift
//  YouTube
//
//  Created by Евгений Липадат on 29.04.2018.
//  Copyright © 2018 Евгений Липадат. All rights reserved.
//

import UIKit

class Settings: NSObject {
    let name: String
    let img: String
    init(name: String, img: String) {
        self.name = name
        self.img = img
    }
}

class SettingsLaunchController: NSObject, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let blackView = UIView()
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    
    
    var settings: [Settings] = {
        return [Settings(name: "Srttings", img: "settings"),
                Settings(name: "Terms & privacy policy", img: "privacy"),
                Settings(name: "Send Feedback", img: "feedback"),
                Settings(name: "Help", img: "help"),
                Settings(name: "Switch Account", img: "switch_account"),
                Settings(name: "Cancel & Dismiss Completely", img: "cancel")]
    }()
    
    func showSettingsMenu() {
        if let window = UIApplication.shared.keyWindow {
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            blackView.frame = window.frame
            blackView.alpha = 0
            window.addSubview(blackView)
            window.addSubview(collectionView)
            collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: 300)
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissBlackView)))
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.collectionView.frame = CGRect(x: 0, y: window.frame.height - 300, width: window.frame.width, height: 300)
                self.blackView.alpha = 1
            }, completion: nil)
        }
    }
    
    @objc func dismissBlackView() {
        if let window = UIApplication.shared.keyWindow {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: 300)
            self.blackView.alpha = 0
        }, completion: nil)
    }
}
    
    
    override init() {
        super.init()
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.register(SettingsCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return settings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? SettingsCell
        cell?.settings = settings[indexPath.item]
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch settings[indexPath.item].name {
        case "Srttings": print("Настройки")
        case "Terms & privacy policy": print("Соглашения")
        case "Send Feedback": print("обр связь")
        case "Help": print("хэлп")
        case "Switch Account": print("сменить акк")
        case "Cancel & Dismiss Completely": dismissBlackView()
        default: break
        }
    }
    
   


} // end

