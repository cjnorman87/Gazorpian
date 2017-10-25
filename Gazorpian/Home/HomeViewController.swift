//
//  HomeViewController.swift
//  Gazorpian
//
//  Created by Christopher Norman on 9/24/17.
//  Copyright © 2017 yakuza. All rights reserved.
//

import UIKit
import Firebase
import Photos

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    let cellid = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        collectionView?.contentInset = UIEdgeInsetsMake(60, 0, 0, 0)
        setupNavigationItems()
        collectionView?.register(HomePostCell.self, forCellWithReuseIdentifier: cellid)
        fetchPosts()
    }
    
    var posts = [Post]()
    fileprivate func fetchPosts() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        Database.fetchUserWithUID(uid: uid) { (user) in
            self.fetchPostsWithUser(user: user)
        }
    }
    
    fileprivate func fetchPostsWithUser(user: User) {
        let ref = Database.database().reference().child("posts").child(user.uid)
        ref.observeSingleEvent(of: .value) { (snapshot) in
            guard let dictionaries = snapshot.value as? [String: Any] else { return }
            dictionaries.forEach({ (key,value) in
                guard let dictionary = value as? [String: Any] else { return }
                var post = Post(user: user, dictionary: dictionary)
                post.id = snapshot.key
                self.posts.insert(post, at: 0)
            })
            self.collectionView?.reloadData()
        }
    }
    
    lazy var searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.placeholder = "Enter Job Name"
        sb.barTintColor = .gray
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = UIColor.rgb(red: 230, green: 230, blue: 230)
        sb.delegate = self
        return sb
    }()
    
    fileprivate func setupNavigationItems() {
        navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "Glance_Logo").withRenderingMode(.alwaysOriginal))
        navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.barTintColor = UIColor.rgb(red: 103, green: 174, blue: 202)
        navigationController?.navigationBar.addSubview(searchBar)
        let navBar = navigationController?.navigationBar
        searchBar.anchor(top: navBar?.bottomAnchor, left: navBar?.leftAnchor, bottom: nil, right: navBar?.rightAnchor, paddingTop: -10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! HomePostCell
        cell.post = posts[indexPath.item]
        
        return cell
        
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        searchBar.isHidden = true
        searchBar.resignFirstResponder()
        let thePost = posts[indexPath.item]
        let viewController = JobController(collectionViewLayout: UICollectionViewFlowLayout())
        JobController.post = thePost.videoUrl
        JobController.sal = thePost.Salary
        JobController.ben = thePost.benefits
        JobController.type = thePost.jobType
        JobController.jobDes = thePost.jobDescrip
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchBar.isHidden = false
    }
}
