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
        collectionView?.contentInset = UIEdgeInsetsMake(60, 0, 0, 0)
        collectionView?.backgroundColor = .white
        collectionView?.register(JobPostCell.self, forCellWithReuseIdentifier: cellid)
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
        let navBar = navigationController?.navigationBar
        segControl.anchor(top: navBar?.bottomAnchor, left: navBar?.leftAnchor, bottom: nil, right: navBar?.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        navigationItem.title = "Jobs"
        navigationController?.navigationBar.barTintColor = .white
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
}
