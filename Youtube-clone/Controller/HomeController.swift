//
//  ViewController.swift
//  Youtube-clone
//
//  Created by Thien Vu Le on Sep/20/18.
//  Copyright © 2018 Thien Vu Le. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController {

    var videos : [Video] = {
        
        let userChannel = Channel()
        userChannel.name = "Tivi Channel"
        userChannel.profileImage = "first_image"
        
        let firstVideo = Video()
        firstVideo.thumbnailImage = "main_image"
        firstVideo.title = "Taylor Swift - Black Space"
        firstVideo.channel = userChannel
        firstVideo.numberOfViews = 100034512312312312
        
        let thirdVideo = Video()
        thirdVideo.thumbnailImage = "main_image"
        thirdVideo.title = "Taylor Swift - Whole Space with the world without love"
        thirdVideo.channel = userChannel
        thirdVideo.numberOfViews = 200955123123213
        
        let secondVideo = Video()
        secondVideo.title = "Eminem - Venom"
        secondVideo.thumbnailImage = "first_image"
        secondVideo.channel = userChannel
        secondVideo.numberOfViews = 3009503
        return [firstVideo, thirdVideo, secondVideo]
    }()
    
//    var darkMode = false
    let menuBar: MenuBar = {
        let menuBar = MenuBar()
        menuBar.translatesAutoresizingMaskIntoConstraints = false
        return menuBar
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func fetchVideos() {
        
        let url = URL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                print(json)
            } catch {
                print(error)
            }
            
//            let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
//            print(str!)
        }.resume()
    }
    
    override func overrideTraitCollection(forChild childViewController: UIViewController) -> UITraitCollection? {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchVideos()
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        
        let titleLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 22)
        
        navigationItem.titleView = titleLabel
        
        collectionView.backgroundColor = .white
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        setupMenuBar()
        setupNavBar()
    }
    
    private func setupNavBar() {
        let searchImage = UIImage(named: "search_icon")?.withRenderingMode(.alwaysOriginal)
        let moreBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "nav_more_icon").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMore))
        let searchBarButton = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        
        navigationItem.rightBarButtonItems = [moreBarButton, searchBarButton]
    }
    
    
    
    @objc func handleSearch() {
        print(123)
    }
    
    @objc func handleMore() {
        print(456)
    }
    
    private func setupMenuBar() {
        view.addSubview(menuBar)
        menuBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        menuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        menuBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! VideoCell
        cell.video = videos[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
