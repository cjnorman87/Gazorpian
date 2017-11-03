//
//  JobsController.swift
//  Gazorpian
//
//  Created by Christopher Norman on 10/14/17.
//  Copyright © 2017 yakuza. All rights reserved.
//

import UIKit

class JobsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let cellid = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.isNavigationBarHidden = true
        collectionView?.contentInset = UIEdgeInsetsMake(40, 0, 0, 0)
        collectionView?.backgroundColor = .white
        collectionView?.register(JobPostCell.self, forCellWithReuseIdentifier: cellid)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "Plus").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleAddCompany))
        self.navigationController?.navigationBar.sizeToFit()
//        collectionView?.register(jobsHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerId")
        setupNavItems()
    }
    
//    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerId", for: indexPath) as! jobsHeader
//        return header
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: view.frame.width, height: 300)
//    }
    
    let segControl: UISegmentedControl = {
        let myArray: NSArray = ["Applied","Liked",]
        let segmControl = UISegmentedControl(items: myArray as [AnyObject])
        segmControl.backgroundColor = .white
        segmControl.tintColor = UIColor.rgb(red: 103, green: 174, blue: 202)
        return segmControl
    }()
    
    fileprivate func setupNavItems() {
        navigationController?.navigationBar.addSubview(segControl)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.prefersLargeTitles = true
        let navBar = navigationController?.navigationBar
        segControl.anchor(top: navBar?.bottomAnchor, left: navBar?.leftAnchor, bottom: nil, right: navBar?.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        navigationItem.title = "Jobs"
        navigationController?.navigationBar.barTintColor = .white
    }
    
    @objc func handleAddCompany() {
        print("Adding company..")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! JobPostCell
//        cell.post = posts[indexPath.item]
        
        return cell
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(false)
        
        //Important!
        if #available(iOS 11.0, *) {
            
            //Default NavigationBar Height is 44. Custom NavigationBar Height is 66. So We should set additionalSafeAreaInsets to 66-44 = 22
            self.additionalSafeAreaInsets.top = 22
            
        }
        
    }
}

class NavigationBar: UINavigationBar {
    
    //set NavigationBar's height
    var customHeight : CGFloat = 200
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.width, height: customHeight)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        frame = CGRect(x: frame.origin.x, y:  0, width: frame.size.width, height: customHeight)
        
        // title position (statusbar height / 2)
        setTitleVerticalPositionAdjustment(-10, for: UIBarMetrics.default)
        
        for subview in self.subviews {
            var stringFromClass = NSStringFromClass(subview.classForCoder)
            if stringFromClass.contains("BarBackground") {
                subview.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: customHeight)
                subview.backgroundColor = .yellow
                
            }
            
            stringFromClass = NSStringFromClass(subview.classForCoder)
            if stringFromClass.contains("BarContent") {
                
                subview.frame = CGRect(x: subview.frame.origin.x, y: 20, width: subview.frame.width, height: customHeight - 20)
                
                subview.backgroundColor = UIColor(red: 20/255, green: 20/255, blue: 20/255, alpha: 0.4)
                
            }
        }
    }
    
    
}
