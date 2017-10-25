//
//  HomePostCell.swift
//  Gazorpian
//
//  Created by Christopher Norman on 9/25/17.
//  Copyright © 2017 yakuza. All rights reserved.
//

import UIKit

class HomePostCell: UICollectionViewCell {
    
    var post: Post? {
        didSet {
            guard let postImageUrl = post?.videoUrl else { return }
            photoImageView.loadImage(urlString: postImageUrl)
            jobLabel.text = post?.jobDescrip
            setupAttributedDate()
        }
    }

    
    let photoImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.backgroundColor = .red
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let jobLabel: UILabel = {
        let label = UILabel()
        label.text = "Lobby Assistant"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    fileprivate func setupAttributedDate() {
        guard let post = self.post else { return }
        let timeAgoDisplay = post.creationDate.timeAgoDisplay()
        let attributedText = NSMutableAttributedString(string: timeAgoDisplay, attributes: [NSAttributedStringKey.font:
            UIFont.boldSystemFont(ofSize: 14), NSAttributedStringKey.foregroundColor: UIColor.gray])
        dateLabel.attributedText = attributedText
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(photoImageView)
        addSubview(jobLabel)
        addSubview(dateLabel)
        
        dateLabel.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 100, height: 20)
        jobLabel.anchor(top: topAnchor, left: photoImageView.rightAnchor, bottom: nil, right: nil, paddingTop: 4, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 200, height: 20)
        photoImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 60, height: 60)
        photoImageView.layer.cornerRadius = 60/2
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
