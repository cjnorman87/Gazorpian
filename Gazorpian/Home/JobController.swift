//
//  JobController.swift
//  Gazorpian
//
//  Created by Christopher Norman on 9/27/17.
//  Copyright © 2017 yakuza. All rights reserved.
//

import UIKit


class JobController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    
    let headerID = "headerId"
    let footerID = "footerId"
    static var post: String?
    static var sal: String?
    static var ben: String?
    static var type: String?
    static var jobDes: String?
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 250)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! JobHeader
            return header
        } else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerID, for: indexPath) as! JobFooter
            return footer
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 400)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
//    let backBtn: UIButton = {
//        let btn = UIButton()
//        btn.setBackgroundImage(#imageLiteral(resourceName: "Back"), for: .normal)
//        btn.addTarget(self, action: #selector(handleTheDismiss), for: .touchUpInside)
//        return btn
//    }()
//
//    
//    @objc func handleTheDismiss() {
//        dismiss(animated: true, completion: nil)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.backItem?.backBarButtonItem?.setBackgroundImage(#imageLiteral(resourceName: "Back"), for: .normal, barMetrics: .default)
        collectionView?.register(JobHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerID)
        collectionView?.register(JobFooter.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerID)
    }
}
