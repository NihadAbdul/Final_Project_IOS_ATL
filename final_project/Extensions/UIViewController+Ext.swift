//
//  UIViewController+Ext.swift
//  final_project
//
//  Created by Nihad on 04.06.24.
//

import UIKit

extension UIViewController{
    
    func showAlert(title: String, message: String){
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertVC.addAction(dismiss)
        present(alertVC, animated: true)
    }
    
    func addShadow(to view: UIView, color: UIColor = .black, opacity: Float = 0.1, offset: CGSize = CGSize(width: 0, height: 4), radius: CGFloat = 12) {
           view.layer.shadowColor = color.cgColor
           view.layer.shadowOpacity = opacity
           view.layer.shadowOffset = offset
           view.layer.shadowRadius = radius
           view.layer.masksToBounds = false
       }
    func popViewController(){
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(named: "chevron-left"), for: .normal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        backButton.tintColor = ColorStyles.Text.gray_500
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    @objc
    private func backButtonTapped() {
            navigationController?.popViewController(animated: true)
    }
}

