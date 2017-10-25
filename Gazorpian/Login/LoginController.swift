//
//  LoginController.swift
//  Gazorpian
//
//  Created by Christopher Norman on 9/18/17.
//  Copyright © 2017 yakuza. All rights reserved.
//

import UIKit
import Firebase

class LoginController: UIViewController {
    
    let emailTextField: UITextField = {
        let Tf = UITextField()
        Tf.placeholder = "email"
        Tf.backgroundColor = UIColor(white:0, alpha: 0.03)
        Tf.borderStyle = .roundedRect
        Tf.font = UIFont.systemFont(ofSize: 14)
        Tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return Tf
    }()
    
    let passwordTextField: UITextField = {
        let Tf = UITextField()
        Tf.placeholder = "password"
        Tf.isSecureTextEntry = true
        Tf.backgroundColor = UIColor(white:0, alpha: 0.03)
        Tf.borderStyle = .roundedRect
        Tf.font = UIFont.systemFont(ofSize: 14)
        Tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return Tf
    }()
    
    @objc func handleTextInputChange(){
        let isFormValid = emailTextField.text?.characters.count ?? 0 > 0 && passwordTextField.text?.characters.count ?? 0 > 0
        if isFormValid{
            loginButton.isEnabled = true
            loginButton.backgroundColor = UIColor.rgb(red: 103, green: 174, blue: 202)
        }else {
            loginButton.isEnabled = false
            loginButton.backgroundColor =  UIColor.rgb(red: 103, green: 174, blue: 202)
        }
    }
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = UIColor.rgb(red: 103, green: 174, blue: 202)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleLogIn), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
    
    @objc func handleLogIn() {
        guard let email = emailTextField.text else { return }
        guard let pass = passwordTextField.text else { return }
        Auth.auth().signIn(withEmail: email, password: pass) { (user, err) in
            
            if let err = err {
                print("Failed to log in user with error: ", err)
                return
            }
            print("Successfully logged user back in", user?.uid ?? "")
            guard let mainTabBarController = UIApplication.shared.keyWindow?.rootViewController as? MainTabBarController else { return }
            mainTabBarController.setUpViewControllers()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    let logoContainerView: UIView = {
        let view = UIView()
        let logoImageView = UIImageView(image: #imageLiteral(resourceName: "Glance logo3x"))
        logoImageView.contentMode = .scaleAspectFill
        view.addSubview(logoImageView)
        logoImageView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 50, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return view
    }()
    
    let dontHaveAccountButton: UIButton = {
       let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account?  ", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14), NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 14), NSAttributedStringKey.foregroundColor : UIColor.rgb(red: 103, green: 174, blue: 202)]))
       button.setAttributedTitle(attributedTitle, for: .normal)
       button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
       return button
    }()
    
    @objc func handleShowSignUp() {
        let signUpController = SignUpController()
        navigationController?.pushViewController(signUpController, animated: true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(logoContainerView)
        logoContainerView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 150)
        
        navigationController?.isNavigationBarHidden = true
        
        view.backgroundColor = .white
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        setupInputFields()
    }
    
    fileprivate func setupInputFields() {
        let stackView = UIStackView(arrangedSubviews: [emailTextField,passwordTextField,loginButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        stackView.anchor(top: logoContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 100, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 140)
        
        
    }
}
