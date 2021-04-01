//
//  LoginButton.swift
//  JoodTAG
//
//  Created by aymane hachcham on 27/3/2021.
//

import Foundation
import UIKit


class LoginButton: UIButton {
    
    let screenSize = UIScreen.main.bounds
    
    init(title: String, backColor: UIColor) {
        super.init(frame: CGRect(x: 0, y: 0, width: screenSize.width/3, height: screenSize.height/6))
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: screenSize.height/45)
        
        self.backgroundColor = backColor
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: screenSize.height/45)
        self.layer.cornerRadius = 10
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.layer.borderWidth = 6/UIScreen.main.nativeScale
        self.layer.shadowOpacity = 0.2
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor
        self.layer.shadowRadius = 6
        self.layer.masksToBounds = true
        
        let buttonWidth = self.frame.width
        let imageWidth = 35
        let spacing = 16
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: buttonWidth - CGFloat(spacing + imageWidth + 70), bottom: 0, right: CGFloat(-spacing))
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: CGFloat(-imageWidth/6), bottom: 0, right: CGFloat(imageWidth/6))
        
    }
    
    convenience init(label: String, titleColor: UIColor, backgroundColor: UIColor, iconName: String, borderColor: CGColor) {
        self.init()
        
        self.backgroundColor = backgroundColor
        self.layer.borderColor = borderColor
        
        self.setTitle(label, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        
        let icon = UIImage(named: iconName)?.resized(newSize: CGSize(width: 30, height: 30))
        self.setImage(icon, for: .normal)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("Object incorrectly initialized")
    }
}

extension UIImage {
    
    func resized(newSize: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(newSize, false, UIScreen.main.scale)
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        guard let resizedImage = UIGraphicsGetImageFromCurrentImageContext() else {return nil}
        UIGraphicsEndImageContext()
        return resizedImage
        
    }
}

//class BtnGoogleSignIn: UIButton {
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//    }
//
//    var myValue: Int
//
//    override init(frame: CGRect) {
//        self.myValue = 0
//
//        super.init(frame: frame)
//
//        let screenSize = UIScreen.main.bounds
//        let screenHeight = screenSize.height
//
//        backgroundColor = .white
//        layer.borderWidth = 6/UIScreen.main.nativeScale
//        layer.backgroundColor = UIColor.white.cgColor
//        setTitleColor(UIColor(red: 117/255, green: 117/255, blue: 117/255, alpha: 1), for: .normal)
//        titleLabel?.font = UIFont(name: "Avenir-Heavy", size: screenHeight/45)
//        layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
//        layer.cornerRadius = 5
//        let icon = UIImage(named: "logo_google_colors")?.resized(newSize: CGSize(width: 35, height: 35))
//        self.setImage( icon, for: .normal)
//        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 100)
//        self.layoutIfNeeded()
//        contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
//        contentHorizontalAlignment = .left
//        layer.shadowOpacity = 0.2
//        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor
//        layer.shadowRadius = 10
//        layer.masksToBounds = true
//        clipsToBounds = false
//        titleEdgeInsets.left = 15
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
