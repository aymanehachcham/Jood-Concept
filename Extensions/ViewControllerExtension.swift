//
//  ViewControllerExtension.swift
//  JoodTAG
//
//  Created by aymane hachcham on 30/3/2021.
//

import Foundation
import UIKit

var spinner: UIView?

extension UIViewController{
    
    func showLoadingIndicator(onVIew: UIView){
        
        let spinnerView = UIView(frame: onVIew.bounds)
        let loadingIndicator = UIActivityIndicatorView(style: .medium)
        loadingIndicator.center = spinnerView.center
        spinnerView.backgroundColor = .systemGray
        loadingIndicator.startAnimating()
        
        DispatchQueue.main.async {
            spinnerView.addSubview(loadingIndicator)
            onVIew.addSubview(spinnerView)
        }
        
        spinner = spinnerView
    }
    
    func stopLoadingIndicator(){
        
        guard let removableSpinner = spinner else {return}
        DispatchQueue.main.async {
            removableSpinner.removeFromSuperview()

        }
    }
}
