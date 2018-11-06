//
//  VideoCell.swift
//  Youtube-clone
//
//  Created by Thien Vu Le on Oct/10/18.
//  Copyright © 2018 Thien Vu Le. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupView() {
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class VideoCell: BaseCell{
    
    var video: Video? {
        didSet {
            titleLabel.text = video?.title
            thumbnailImageView.image = UIImage(named: (video?.thumbnailImage)!)
            if let profileImage = video?.channel?.profileImage {
                userProfileImageView.image = UIImage(named: profileImage)
            }
            
            if let nameChannel = video?.channel?.name, let numberOfViews = video?.numberOfViews {
                let numberWithFormat = NumberFormatter()
                numberWithFormat.numberStyle = .decimal
                
                let subText = "\(nameChannel) - \(numberWithFormat.string(from: numberOfViews)!) views - 2 months ago"
                subtitleTextView.text = subText
            }
            
            if let title = video?.title {
                let size = CGSize(width: frame.width - 16 - 40 - 8 - 16, height: 1000)
                let option = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
                
                let estimateRect = NSString(string: title).boundingRect(with: size, options: option, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)], context: nil)
                if estimateRect.size.height > 20 {
                    titleLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
                } else {
                    titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
                }
                
            }
        }
    }
    
    
    let thumbnailImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "main_image")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .green
        imageView.image = UIImage(named: "first_image")
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let seperator: UIView = {
        let seperate = UIView()
        seperate.backgroundColor = UIColor.rgb(red: 230, green: 230, blue: 230)
        seperate.translatesAutoresizingMaskIntoConstraints = false
        return seperate
    }()
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Hello world - This is the youtube clone"
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 2
        return title
    }()
    
    let subtitleTextView : UITextView = {
        let textView = UITextView()
        //        textView.backgroundColor = .red
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "VuiVeChannel - 1,186,980 views - 2 months ago"
        textView.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        textView.textColor = .lightGray
        return textView
    }()
    
    var titleHeightLayout: NSLayoutConstraint?
    
    override func setupView() {
        addSubview(thumbnailImageView)
        
        thumbnailImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        thumbnailImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        thumbnailImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        //        thumbnailImageView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        //        thumbnailImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        addSubview(userProfileImageView)
        userProfileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        userProfileImageView.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 8).isActive = true
        userProfileImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        userProfileImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        //        userProfileImageView.bottomAnchor.constraint(equalTo: seperator.topAnchor, constant: 16).isActive = true
        
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 8).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: userProfileImageView.trailingAnchor, constant: 8).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
//        titleLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        addSubview(subtitleTextView)
        subtitleTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
        subtitleTextView.leadingAnchor.constraint(equalTo: userProfileImageView.trailingAnchor, constant: 8).isActive = true
        subtitleTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        subtitleTextView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        addSubview(seperator)
        seperator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        seperator.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        seperator.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        seperator.topAnchor.constraint(equalTo: subtitleTextView.bottomAnchor, constant: 8).isActive = true
        seperator.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    
}

