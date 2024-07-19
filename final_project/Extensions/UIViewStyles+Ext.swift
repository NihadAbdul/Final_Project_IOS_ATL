//
//  UIViewStyles+Ext.swift
//  final_project
//
//  Created by Nihad on 02.06.24.
//

import UIKit

extension UIView{
    func applyInputBackground(){
        self.backgroundColor = ColorStyles.Background.inputBackground
    }
    func applyViewBackground(){
        self.backgroundColor = ColorStyles.Background.viewBackground
    }
    func applyLineBackground(){
        self.backgroundColor = ColorStyles.Background.lineBackground
    }
    func applyBorderStyle(){
        self.backgroundColor = .clear
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 8
        self.layer.borderColor = ColorStyles.Border.gray_100?.cgColor
    }
    func applyButtonBackground(){
        self.backgroundColor = ColorStyles.Background.buttonBackground
    }
}

