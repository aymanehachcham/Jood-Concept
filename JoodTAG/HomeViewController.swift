//
//  HomeViewController.swift
//  JoodTAG
//
//  Created by aymane hachcham on 27/3/2021.
//

import Foundation
import Firebase

import UIKit

class HomeViewController: UIViewController {
    
    var authController: AuthViewController?
    
    lazy var googleSignInButton: LoginButton = {
        
        var button = LoginButton(title: "Sign out", backColor: .lightGray)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handleSignOut), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        view.backgroundColor = .systemBlue
        
        view.addSubview(googleSignInButton)
        
    }
    
    @objc private func handleSignOut(){
        
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }

    }
    
}
