//
//  UserProfileHeader.swift
//  Gazorpian
//
//  Created by Christopher Norman on 9/16/17.
//  Copyright © 2017 yakuza. All rights reserved.
//

import UIKit
import Firebase

class UserProfileHeader: UICollectionViewCell {
    
    var user: User? {
        didSet {
            setupProfileImage()
        }
    }
    
    let profileImageView : UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        return iv
    }()
    
    let editProfileBtn: UIButton = {
       let btn = UIButton()
       btn.setBackgroundImage(#imageLiteral(resourceName: "Image-13"), for: .normal)
       return btn
    }()
    
    let infoBtn: UIButton = {
       let info = UIButton()
       info.setBackgroundImage(#imageLiteral(resourceName: "Image-14"), for: .normal)
       return info
    }()
    
    let settingsBtn: UIButton = {
        let settings = UIButton()
        settings.setBackgroundImage(#imageLiteral(resourceName: "Image-16"), for: .normal)
        return settings
    }()
    
    let skillsBtn: UIButton = {
        let skills = UIButton()
        skills.setBackgroundImage(#imageLiteral(resourceName: "Image-15"), for: .normal)
        return skills
    }()
    
    let infoLabel: UILabel = {
        let info = UILabel()
        info.text = "Info"
        info.font = UIFont.boldSystemFont(ofSize: 14)
        info.textColor = UIColor.rgb(red: 93, green: 188, blue: 210)
        return info
    }()
    
    let skillsLabel: UILabel = {
        let skills = UILabel()
        skills.text = "Skills"
        skills.font = UIFont.boldSystemFont(ofSize: 14)
        skills.textColor = UIColor.rgb(red: 93, green: 188, blue: 210)
        return skills
    }()
    
    let settingsLabel: UILabel = {
        let settings = UILabel()
        settings.text = "settings"
        settings.font = UIFont.boldSystemFont(ofSize: 14)
        settings.textColor = UIColor.rgb(red: 93, green: 188, blue: 210)
        return settings
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 50, paddingLeft: 85, paddingBottom: 0, paddingRight: 0, width: 200, height: 200)
        profileImageView.layer.cornerRadius = 200/2
        profileImageView.clipsToBounds = true
       addSubview(editProfileBtn)
        editProfileBtn.anchor(top: profileImageView.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 230, paddingBottom: 0, paddingRight: 0, width: 50, height: 50)
        setupInputFields()
        setupLabelFields()
    }
    
    fileprivate func setupInputFields() {
        let stackView = UIStackView(arrangedSubviews: [infoBtn,settingsBtn,skillsBtn])
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.spacing = 10
        
        addSubview(stackView)
        
        stackView.anchor(top: editProfileBtn.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 20, paddingLeft: 90, paddingBottom: 0, paddingRight: 240, width: 20, height: 200)
    }

    fileprivate func setupLabelFields() {
        let stackView = UIStackView(arrangedSubviews: [infoLabel, skillsLabel, settingsLabel])
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.spacing = 5
        
        addSubview(stackView)
        
        stackView.anchor(top: editProfileBtn.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 30, paddingLeft: 150, paddingBottom: 0, paddingRight: 10, width: 20, height: 185)
    }
    
    fileprivate func setupProfileImage() {
        guard let profileImageUrl = user?.profileImageUrl else { return }
        guard let url = URL(string: profileImageUrl) else { return }
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, err) in
            guard let data = data else { return }
            let image = UIImage(data: data)
            DispatchQueue.main.sync {
                self.profileImageView.image = image
            }
            self.profileImageView.image = image
        }).resume()
     }
    
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
