//
//  JobHeader.swift
//  Gazorpian
//
//  Created by Christopher Norman on 9/27/17.
//  Copyright © 2017 yakuza. All rights reserved.
//

import UIKit
//protocol closeThePostDelegate {
//     func handleDismiss()
//}

class JobHeader: UICollectionViewCell {
//    var delegate: closeThePostDelegate?
    let postImageUrl = JobController.post
    
    let photoImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.backgroundColor = .red
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    let likeBtn: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(#imageLiteral(resourceName: "LikeBtn"), for: .normal)
        return btn
    }()
//    let backBtn: UIButton = {
//        let btn = UIButton()
//        btn.setBackgroundImage(#imageLiteral(resourceName: "Back"), for: .normal)
//        btn.addTarget(self, action: #selector(handleTheDismiss), for: .touchUpInside)
//        return btn
//    }()
    let shareBtn: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(#imageLiteral(resourceName: "Share"), for: .normal)
        return btn
    }()
    let userLabel: UILabel = {
        let skills = UILabel()
        skills.text = "Skills"
        skills.textAlignment = .center
        skills.font = UIFont.boldSystemFont(ofSize: 14)
        skills.textColor = UIColor.rgb(red: 93, green: 188, blue: 210)
        return skills
    }()
    let locationLabel: UILabel = {
        let skills = UILabel()
        skills.text = "San Fransisco"
        skills.font = UIFont.boldSystemFont(ofSize: 14)
        skills.textColor = UIColor.rgb(red: 93, green: 188, blue: 210)
        return skills
    }()
    let SalaryLabel: UILabel = {
        let Salary = UILabel()
        Salary.text = "Salary"
        Salary.font = UIFont.boldSystemFont(ofSize: 14)
        return Salary
    }()
    let BenefitsLabel: UILabel = {
        let Benefits = UILabel()
        Benefits.text = "Benefits"
        Benefits.font = UIFont.boldSystemFont(ofSize: 14)
        return Benefits
    }()
    let TypeLabel: UILabel = {
        let Type = UILabel()
        Type.text = "Type"
        Type.font = UIFont.boldSystemFont(ofSize: 14)
        return Type
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        photoImageView.loadImage(urlString: postImageUrl!)
        
        addSubview(photoImageView)
        addSubview(shareBtn)
        addSubview(likeBtn)
//        addSubview(backBtn)
        addSubview(userLabel)
        addSubview(locationLabel)
        photoImageView.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 120, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        photoImageView.layer.cornerRadius = 100 / 2
        photoImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        shareBtn.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 4, width: 30, height: 30)
        likeBtn.anchor(top: topAnchor, left: nil, bottom: nil, right: shareBtn.leftAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 2, width: 30, height: 30)
//        backBtn.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 25, height: 25)
        userLabel.anchor(top: photoImageView.bottomAnchor, left: photoImageView.leftAnchor, bottom: nil, right: photoImageView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 30)
        locationLabel.anchor(top: userLabel.bottomAnchor, left: userLabel.leftAnchor, bottom: nil, right: userLabel.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 30)
        
    }
    
//    static let updateFeedNotificationName = NSNotification.Name(rawValue: "UpdateFeed")
    
//    @objc func handleTheDismiss() {
//        delegate?.handleDismiss
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
