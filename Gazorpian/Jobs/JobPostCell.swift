//
//  JobPostCell.swift
//  Gazorpian
//
//  Created by Christopher Norman on 10/15/17.
//  Copyright © 2017 yakuza. All rights reserved.
//

import UIKit

class JobPostCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        contentView.addSubview(jobView)
        jobView.addSubview(salLab)
        jobView.addSubview(Benefits)
        jobView.addSubview(theType)
        jobView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 40, paddingBottom: 30, paddingRight: 40, width: 312, height: 134)
        setupLabelFields()
        salLab.anchor(top: nil, left: jobView.leftAnchor, bottom: jobView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 25, paddingRight: 0, width: 150, height: 10)
        Benefits.anchor(top: salLab.bottomAnchor, left: salLab.leftAnchor, bottom: jobView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 150, height: 10)
        theType.anchor(top: nil, left: nil, bottom: jobView.bottomAnchor, right: jobView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 25, paddingRight: 0, width: 120, height: 15)
//        jobView.addSubview(samllAppBtn)
//        jobView.addSubview(heartBtn)
//        jobView.addSubview(jobView)
//        samllAppBtn.anchor(top: jobView.topAnchor, left: jobView.leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 40, height: 40)
//        heartBtn.anchor(top: jobView.topAnchor, left: nil, bottom: nil, right: jobView.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 20, width: 40, height: 40)
//        coLabel.anchor(top: jobView.topAnchor, left: jobView.leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 80, paddingBottom: 0, paddingRight: 0, width: 40, height: 40)
        
    }
    
    let jobView: UIView = {
        let vw = UIView()
        vw.backgroundColor = UIColor.rgb(red: 103, green: 174, blue: 202)
        vw.layer.cornerRadius = 10
        return vw
    }()
    
    let coImage: UIImageView = {
        let vw = UIImageView()
        vw.image = #imageLiteral(resourceName: "google-new-logo")
        vw.layer.cornerRadius = vw.frame.width / 2
        vw.clipsToBounds = true
        return vw
    }()
    
    let samllAppBtn: UIImageView = {
        let vw = UIImageView()
        vw.image = #imageLiteral(resourceName: "AppBtn")
        return vw
    }()
    
    let heartBtn: UIImageView = {
        let vw = UIImageView()
        vw.image = #imageLiteral(resourceName: "Heart")
        return vw
    }()
    
    let salLab: UILabel = {
        let lb = UILabel()
        lb.text = "Salary: $100/hr"
        return lb
    }()
    
    let theType: UILabel = {
        let lb = UILabel()
        lb.text = "Type: Full-Time"
        return lb
    }()
    
    let Benefits: UILabel = {
        let lb = UILabel()
        lb.text = "Benefits: Health Care"
        return lb
    }()
    
    fileprivate func setupLabelFields() {
        let stackView = UIStackView(arrangedSubviews: [samllAppBtn,coImage,heartBtn])
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.axis = .horizontal
        jobView.addSubview(stackView)
        stackView.anchor(top: jobView.topAnchor, left: jobView.leftAnchor, bottom: nil, right: jobView.rightAnchor, paddingTop: 10, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 280, height: 60)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
