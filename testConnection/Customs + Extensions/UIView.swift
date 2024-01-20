//
//  UIView.swift
//  testConnection
//
//  Created by Mohamed Ali on 20/01/2024.
//

import UIKit

extension UIView {
    
    func loadViewFromNib (nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib (nibName: nibName, bundle: bundle)
        return nib.instantiate (withOwner: self, options: nil).first as? UIView
    }
}
