//
//  LoginViewController.swift
//  chatapptb
//
//  Created by Oreofe Solarin on 31/08/2020.
//  Copyright © 2020 Oreofe Solarin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
         return scrollView
    }()
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
        
    }()
    private let emailField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Email Address..."
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .secondarySystemBackground
       return field
    }()
    private let passwordField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .done
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Password..."
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .secondarySystemBackground
        field.isSecureTextEntry = true
        return field
    }()

    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()

//    private let facebookLoginButton: FBLoginButton = {
//        let button = FBLoginButton()
//        button.permissions = ["email,public_profile"]
//        return button
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register", style: .done, target: self, action: #selector(didTapRegister))
        loginButton.addTarget(self,
        action: #selector(loginButtonTapped),
        for: .touchUpInside)
        emailField.delegate = self
        passwordField.delegate = self
        view.addSubview(scrollView)
        view.addSubview(imageView)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(loginButton)
//        scrollView.addSubview(facebookLoginButton)
//        scrollView.addSubview(googleLogInButton)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
              scrollView.frame = view.bounds

              let size = scrollView.width/3
              imageView.frame = CGRect(x: (scrollView.width-size)/2,
                                       y: 100,
                                       width: size,
                                       height: size)
              emailField.frame = CGRect(x: 30,
                                        y: imageView.bottom+10,
                                        width: scrollView.width-60,
                                        height: 52)
              passwordField.frame = CGRect(x: 30,
                                           y: emailField.bottom+10,
                                           width: scrollView.width-60,
                                           height: 52)
              loginButton.frame = CGRect(x: 30,
                                         y: passwordField.bottom+10,
                                         width: scrollView.width-60,
                                         height: 52)
    }
    @objc private func loginButtonTapped() {
           emailField.resignFirstResponder()
           passwordField.resignFirstResponder()

           guard let email = emailField.text, let password = passwordField.text,
               !email.isEmpty, !password.isEmpty, password.count >= 6 else {
                   alertUserLoginError()
                   return
           }
    }
    func alertUserLoginError() {
        let alert = UIAlertController(title: "Woops",
                                      message: "Please enter all information to log in.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"Dismiss",
                                      style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    @objc private func didTapRegister(){
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

  

}
extension LoginViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if textField == emailField {
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField {
            loginButtonTapped()
        }

        return true
    }

}
