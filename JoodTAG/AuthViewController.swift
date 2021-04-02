//
//  AuthViewController.swift
//  JoodTAG
//
//  Created by aymane hachcham on 29/3/2021.
//

import Foundation
import Firebase

class AuthViewController: UINavigationController {
    
    var stateHandler: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func loginTwitter(twitterProvider: OAuthProvider){
        
        print("TWITTER")
        twitterProvider.getCredentialWith(nil, completion: { (credential, error) in
            if error != nil {
                self.stopLoadingIndicator()
                print("Twitter error credentials: ", error!)
            }
            
            if credential != nil {
                Auth.auth().signIn(with: credential!, completion: {(authResult, error) in
                    if error != nil {
                        self.stopLoadingIndicator()
                        print(error!)
                    }
                })
            }
        })
        
    }
    
    func listenToChanges(source: UIViewController, target: UIViewController){
        
        stateHandler = Auth.auth().addStateDidChangeListener({(auth, user) in
            
            self.stopLoadingIndicator()
                guard user != nil else {
                    print("AuthController declares user not signed in")
                    target.dismiss(animated: true, completion: nil)
                    return
                }
                print("AuthController declares user signed in")
                source.present(target, animated: true, completion: nil)
            })
    }
    
    deinit {
        if let handler = stateHandler {
            print("Deinit AuthController")
            Auth.auth().removeStateDidChangeListener(handler)
        }
    }
}
