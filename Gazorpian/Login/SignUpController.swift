//
//  ViewController.swift
//  Gazorpian
//
//  Created by Christopher Norman on 9/15/17.
//  Copyright © 2017 yakuza. All rights reserved.
//

import UIKit
import Firebase

class SignUpController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "plus_photo").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handlePlusPhoto), for: .touchUpInside)
        return button
    }()
    @objc func handlePlusPhoto(){
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        present(imagePickerController, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage{
          plusPhotoButton.setImage(editedImage.withRenderingMode(.alwaysOriginal), for: .normal)
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage{
          plusPhotoButton.setImage(originalImage.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        plusPhotoButton.layer.cornerRadius = plusPhotoButton.frame.width/2
        plusPhotoButton.layer.masksToBounds = true
        plusPhotoButton.layer.borderColor = UIColor.black.cgColor
        plusPhotoButton.layer.borderWidth = 3
        dismiss(animated: true, completion: nil)
    
    }
    let emailTextField: UITextField = {
        let Tf = UITextField()
        Tf.placeholder = "email"
        Tf.backgroundColor = UIColor(white:0, alpha: 0.03)
        Tf.borderStyle = .roundedRect
        Tf.font = UIFont.systemFont(ofSize: 14)
        Tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return Tf
    }()
    @objc func handleTextInputChange(){
        let isFormValid = emailTextField.text?.characters.count ?? 0 > 0 && usernameTextField.text?.characters.count ?? 0 > 0 && passwordTextField.text?.characters.count ?? 0 > 0
        if isFormValid{
            signUpButton.isEnabled = true
           signUpButton.backgroundColor = UIColor.rgb(red: 17, green: 154, blue: 237)
        }else {
            signUpButton.isEnabled = false
            signUpButton.backgroundColor =  UIColor.rgb(red: 103, green: 174, blue: 202)
        }
    }
    let usernameTextField: UITextField = {
        let Tf = UITextField()
        Tf.placeholder = "username"
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
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = UIColor.rgb(red: 103, green: 174, blue: 202)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
    
    @objc func handleSignUp() {
        guard let email = emailTextField.text, email.characters.count > 0 else {return}
        guard let username = usernameTextField.text, username.characters.count > 0 else {return}
        guard let pass = passwordTextField.text, pass.characters.count > 0 else {return}
        Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
            if let err = error{
                print("Cj: this is the errer", err)
                return
            }
            print("Login Success:", user?.uid ?? "")
            guard let image = self.plusPhotoButton.imageView?.image else { return }
            guard let uploadData = UIImageJPEGRepresentation(image, 0.3) else { return }
            let filename = NSUUID().uuidString
            Storage.storage().reference().child("profile_images").child(filename).putData(uploadData, metadata: nil, completion: { (metadata, err) in
                if let err = err{
                    print("Failed to upload profile image:", err)
                    return
                }
                guard let profileImageURL = metadata?.downloadURL()?.absoluteString else { return }
                print("Successful;y uploaded profile image", profileImageURL)
        
                guard let uid = user?.uid else { return }
                let dictionaryValues = ["username" : username, "profileImageURL": profileImageURL]
                let values = [uid: dictionaryValues]
                Database.database().reference().child("users").updateChildValues(values, withCompletionBlock: { (err, ref) in

                if let err = error {
                    print("Failed to save user info into db:", err)
                    return
                }
                print("Successfully saved user info to DB")
                    guard let mainTabBarController = UIApplication.shared.keyWindow?.rootViewController as? MainTabBarController else { return }
                    mainTabBarController.setUpViewControllers()
                    self.dismiss(animated: true, completion: nil)
            })
            })
        }
    }
    
    let alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Already have an account?  ", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14), NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        attributedTitle.append(NSAttributedString(string: "Login", attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 14), NSAttributedStringKey.foregroundColor : UIColor.rgb(red: 17, green: 154, blue: 237)]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleAlreadyHaveAccount), for: .touchUpInside)
        return button
    }()
    
    @objc func handleAlreadyHaveAccount() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
        view.backgroundColor = .white
        
        view.addSubview(plusPhotoButton)
        
        plusPhotoButton.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 40, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 140, height: 140)
        plusPhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        setupInputFields()
        
    }
    fileprivate func setupInputFields() {
        let stackView = UIStackView(arrangedSubviews: [emailTextField,usernameTextField,passwordTextField,signUpButton])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        view.addSubview(stackView)
        
        stackView.anchor(top: plusPhotoButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 20, height: 200)
    }
}



