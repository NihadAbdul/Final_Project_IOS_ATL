//
//  UIButtonStyles+Ext.swift
//  final_project
//
//  Created by Nihad on 02.06.24.
//

import UIKit

extension UIButton{
    func applyPrimaryStyle(){
        self.backgroundColor = ColorStyles.Button.brand
        self.setTitleColor(ColorStyles.Text.white, for: .normal)
    }
    func applySecondaryStyle(){
        self.backgroundColor = ColorStyles.Button.brand_seconday
        self.setTitleColor(ColorStyles.Button.brand, for: .normal)
    }
    func applyTertiaryStyle(){
        self.backgroundColor = .clear
        self.setTitleColor(ColorStyles.Text.brand, for: .normal)
        self.titleLabel?.font = TextStyles.Button.medium
    }
    func applyLightStyle(){
        self.backgroundColor = ColorStyles.Button.brand_light
        self.setTitleColor(ColorStyles.Text.white, for: .normal)
        self.titleLabel?.font = TextStyles.Button.medium
    }
    func applyOnlyBorderStyle(){
        self.backgroundColor = .clear
        self.layer.borderWidth = 1
        self.layer.borderColor = ColorStyles.Border.gray_100?.cgColor
        self.setTitleColor(ColorStyles.Text.gray_500, for: .normal)
    }
}


