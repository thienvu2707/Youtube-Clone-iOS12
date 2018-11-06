//
//  MenuBar.swift
//  Youtube-clone
//
//  Created by Thien Vu Le on Oct/15/18.
//  Copyright © 2018 Thien Vu Le. All rights reserved.
//

import UIKit

class MenuBar: UIView {
    
    let images = ["home", "trending", "subscriptions", "account"]
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let cellId = "MenuBarId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        
        let indexPath = IndexPath(row: 0, section: 0)
        collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .init(rawValue: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MenuCell: BaseCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "home")
        return iv
    }()
    
    override var isHighlighted: Bool {
        didSet{
            imageView.tintColor = isHighlighted ? .white : UIColor.rgb(red: 91, green: 14, blue: 13)
        }
    }
    
    override var isSelected: Bool {
        didSet{
            imageView.tintColor = isSelected ? .white : UIColor.rgb(red: 91, green: 14, blue: 13)
        }
    }
    
    override func setupView() {
        super.setupView()
        addSubview(imageView)
        
        imageView.heightAnchor.constraint(equalToConstant: 28).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 28).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
    }
}
