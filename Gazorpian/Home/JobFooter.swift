//
//  JobFooter.swift
//  Gazorpian
//
//  Created by Christopher Norman on 10/4/17.
//  Copyright © 2017 yakuza. All rights reserved.
//

import UIKit

class JobFooter: UICollectionViewCell {
    let theSalary = JobController.sal
    let theBenefits = JobController.ben
    let theType = JobController.type
    let theJob = JobController.jobDes
    
    let containerView: UIView = {
        let cv = UIView()
        cv.backgroundColor = .gray
        return cv
    }()
    let jobDescripView: UIView = {
        let jobView = UIView()
        jobView.backgroundColor = .white
        return jobView
    }()
    let salLabel: UILabel = {
        let lab = UILabel()
        lab.text = "Salary"
        return lab
    }()
    let benLabel: UILabel = {
        let lab = UILabel()
        lab.text = "Benefits"
        return lab
    }()
    let typeLabel: UILabel = {
        let lab = UILabel()
        lab.text = "Type"
        return lab
    }()
    let salInLabel: UILabel = {
        let lab = UILabel()
        return lab
    }()
    let benInLabel: UILabel = {
        let lab = UILabel()
        return lab
    }()
    let typeInLabel: UILabel = {
        let lab = UILabel()
        return lab
    }()
    let jobLabel: UILabel = {
        let lab = UILabel()
        lab.text = "Job Desctiption"
        return lab
    }()
    let textView: UITextView = {
        let tv = UITextView()
        tv.text = "Some example text that should extend all the way down the screen. Im just going to start talking about random stuff like, how cool it is to code all day. Syke this gets annoying sometimes. Let me put some extra shit like an actual job description. Ok we want you to make a redicoulusly large app and then we are only going to give you fifty percent just because we want to expose how nice you are."
        return tv
    }()
    let appBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "ApplyBtn"), for: .normal)
        return btn
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        salInLabel.text = theSalary
        benInLabel.text = theBenefits
        typeInLabel.text = theType
        
        addSubview(containerView)
        addSubview(jobDescripView)
        jobDescripView.addSubview(jobLabel)
        addSubview(appBtn)
        jobDescripView.addSubview(textView)
        setupLabelFields()
        setupInputFields()
        jobLabel.anchor(top: jobDescripView.topAnchor, left: jobDescripView.leftAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 150, height: 40)
        textView.anchor(top: jobLabel.bottomAnchor, left: jobDescripView.leftAnchor, bottom: jobDescripView.bottomAnchor, right: jobDescripView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        appBtn.anchor(top: nil, left: leftAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 7, paddingRight: 0, width: 0, height: 52)
        containerView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 120)
        jobDescripView.anchor(top: nil, left: leftAnchor, bottom: appBtn.topAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 230)
    }
    
    fileprivate func setupLabelFields() {
        let stackView = UIStackView(arrangedSubviews: [salLabel,benLabel,typeLabel])
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        containerView.addSubview(stackView)
        stackView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 150, height: 100)
    }
    
    fileprivate func setupInputFields() {
        let stackView = UIStackView(arrangedSubviews: [salInLabel,benInLabel,typeInLabel])
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        containerView.addSubview(stackView)
        stackView.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 150, height: 100)
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
