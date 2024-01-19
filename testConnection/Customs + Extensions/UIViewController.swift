//
//  UIViewController.swift
//  testConnection
//
//  Created by Mohamed Ali on 19/01/2024.
//

import Foundation
import RappleProgressHUD

extension UIViewController {
    
    func startLoading() {
        RappleActivityIndicatorView.startAnimatingWithLabel("Please wait", attributes: RappleModernAttributes)
    }
    
    func dismissLoading() {
        RappleActivityIndicatorView.stopAnimation()
    }
}
