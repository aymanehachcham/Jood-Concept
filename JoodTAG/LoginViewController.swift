//
//  ViewController.swift
//  JoodTAG
//
//  Created by aymane hachcham on 27/3/2021.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginViewController: UIViewController {
    
    var handleAuthentication: AuthStateDidChangeListenerHandle?
    var authController: AuthViewController?
    let screenSize = UIScreen.main.bounds
    var spinner: UIView?
    var twitterProvider = OAuthProvider(providerID: "twitter.com")
    
    lazy var googleSignInButton: LoginButton = {
        
        var button = LoginButton(
            label: "Sign with Google",
            titleColor: .black,
            backgroundColor: UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1),
            iconName: "googleLogo",
            borderColor: UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1).cgColor)
        
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handleGoogleSignIn), for: .touchUpInside)
        
        return button
    }()
    
    lazy var twitterSignInButton: LoginButton = {
        
        var button = LoginButton(
            label: "Sign with Twitter",
            titleColor: .black,
            backgroundColor: UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1),
            iconName: "twitterLogo",
            borderColor: UIColor(red: 20/255, green: 155/255, blue: 230/255, alpha: 1).cgColor)
        
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleTwitterSignIn), for: .touchUpInside)
        
        return button
    }()
    
    lazy var buttonStack: UIStackView = {
       
        var stack = UIStackView(frame: self.view.bounds)
        stack.distribution = UIStackView.Distribution.equalSpacing
        stack.spacing = googleSignInButton.screenSize.height/30
        
        stack.alignment = .center
        stack.axis = .vertical
        
        stack.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        googleSignInButton.heightAnchor.constraint(equalToConstant: googleSignInButton.screenSize.height/14).isActive = true
        googleSignInButton.widthAnchor.constraint(equalToConstant: googleSignInButton.screenSize.width*5/6).isActive = true
        twitterSignInButton.widthAnchor.constraint(equalToConstant: twitterSignInButton.screenSize.width*5/6).isActive = true
        twitterSignInButton.heightAnchor.constraint(equalToConstant: twitterSignInButton.screenSize.height/14).isActive = true
        
        stack.addArrangedSubview(googleSignInButton)
        stack.addArrangedSubview(twitterSignInButton)
        
        return stack
    }()

    deinit {
        print("Login Screen no longer exists")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        spinner = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        
        view.addSubview(buttonStack)
        
        initConstraints()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        authController = AuthViewController()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        dismiss(animated: true, completion: nil)
    }
    
    func initConstraints(){
        
        NSLayoutConstraint.activate([
            
            buttonStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: screenSize.height/1.7),
            buttonStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: screenSize.width/8),
        ])
    }
    
    @objc private func handleGoogleSignIn(){
        self.showLoadingIndicator(onVIew: self.view)
        GIDSignIn.sharedInstance().signIn()
        
    }
    
    @objc private func handleTwitterSignIn(){
        self.showLoadingIndicator(onVIew: self.view)
        authController?.loginTwitter(twitterProvider: twitterProvider)
    }
    
}

