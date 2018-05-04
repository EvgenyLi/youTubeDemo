//
//  ViewController.swift
//  YouTube
//
//  Created by Евгений Липадат on 26.04.2018.
//  Copyright © 2018 Евгений Липадат. All rights reserved.
//

import UIKit

class MainViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var videos = [Video]()
    let blackView = UIView()
    let menuBar: MenuBar = {
        let menu = MenuBar()
        menu.translatesAutoresizingMaskIntoConstraints = false
        return menu
    }()
    
    let redLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 1000, height: 50))
        label.backgroundColor = UIColor(red: 230/255, green: 32/255, blue: 32/255, alpha: 1)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchVideo()
        collecionAndNavbarSettings()
        setupLayout()
        setupBarButtonSearchAndMore()
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    
    
    func fetchVideo() {
        ApiService.sharedInstance.fetchVideo { (videos) in
            self.videos = videos
            self.collectionView?.reloadData()
        }
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? VideoCell else {return UICollectionViewCell()}
        cell.video = videos[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 270)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.5
    }
    
    
    func collecionAndNavbarSettings() {
        navigationController?.navigationBar.isTranslucent = false
        let homeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        homeLabel.textColor = .white
        homeLabel.text = "Home"
        homeLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = homeLabel
        collectionView?.backgroundColor = UIColor(white: 0.9, alpha: 1)
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
    }
    
    func setupBarButtonSearchAndMore() {
        let searchImage = UIImage(named: "search_icon")?.withRenderingMode(.alwaysOriginal)
        let barButtonSearch = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(searchButtonTapped))
        let moreImage = UIImage(named: "nav_more_icon")?.withRenderingMode(.alwaysOriginal)
        let barButtonMore = UIBarButtonItem(image: moreImage, style: .plain, target: self, action: #selector(moreButtonTapped))
        navigationItem.rightBarButtonItems = [barButtonMore, barButtonSearch]
    }
    
    let settingsMenuController = SettingsLaunchController()
    @objc func searchButtonTapped(){
        
    }
    @objc func moreButtonTapped(){
        settingsMenuController.showSettingsMenu()
    }
    
    
    func setupLayout() {
    self.view.addSubview(redLabel)
    self.view.addSubview(menuBar)
        navigationController?.hidesBarsOnSwipe = true
        menuBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        menuBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        menuBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        menuBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

} // end

