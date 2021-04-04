//
//  AppDelegate.swift
//  JoodTAG
//
//  Created by aymane hachcham on 27/3/2021.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

@main
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        GIDSignIn.sharedInstance()?.clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance()?.delegate = self 
        
        return true
    }
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
    
        if let signInError = error {
                     
            LoginViewController().stopLoadingIndicator()
            
            switch (signInError as NSError).code {
            
            case GIDSignInErrorCode.canceled.rawValue:
                print("Canceled")
            case GIDSignInErrorCode.hasNoAuthInKeychain.rawValue:
                print("Authentication failed")
            case GIDSignInErrorCode.unknown.rawValue:
                print("Unknow error occured")
            default:
                print("Error while sign in user: ", signInError)
            }
            
            return
        }
        
        guard let userAuthentication = user.authentication else {return}
        let credentials = GoogleAuthProvider.credential(withIDToken: userAuthentication.idToken, accessToken: userAuthentication.accessToken)
        
        Auth.auth().signIn(with: credentials, completion: { (authUser, signError) in
            if let error = signError {
                print("Error SignIn Google: (AppDelegate): ", error)
                return
            }
            
            let userName = authUser?.user.displayName
            print("User signed In Google (AppDelegate): ", userName!)
        })
        
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        print("User: \(user.profile.name!) did sign off")
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        guard let sharedInstance = GIDSignIn.sharedInstance() else { return false}
        return sharedInstance.handle(url)
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

