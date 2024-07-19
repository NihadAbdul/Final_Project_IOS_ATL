//
//  UITableviewCollectionViewCell+Ext.swift
//  final_project
//
//  Created by Nihad on 31.05.24.
//

import UIKit

extension UITableViewCell{
    
    static var identifier: String{
        return String(describing: self)
    }
    
    func noSelectionStyle() {
        self.selectionStyle = .none
    }
    func addShadow(to view: UIView, color: UIColor = .black, opacity: Float = 0.2, offset: CGSize = CGSize(width: 0, height: 4), radius: CGFloat = 12) {
           view.layer.shadowColor = color.cgColor
           view.layer.shadowOpacity = opacity
           view.layer.shadowOffset = offset
           view.layer.shadowRadius = radius
           view.layer.masksToBounds = false
       }
}

extension UICollectionViewCell{
    
    static var identifier: String{
        return String(describing: self)
    }
    
    func addShadow(to view: UIView, color: UIColor = .black, opacity: Float = 0.2, offset: CGSize = CGSize(width: 0, height: 2), radius: CGFloat = 8) {
           view.layer.shadowColor = color.cgColor
           view.layer.shadowOpacity = opacity
           view.layer.shadowOffset = offset
           view.layer.shadowRadius = radius
           view.layer.masksToBounds = false
       }
}
