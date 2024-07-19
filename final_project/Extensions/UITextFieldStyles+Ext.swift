//
//  UITextFieldStyles+Ext.swift
//  final_project
//
//  Created by Nihad on 02.06.24.
//

import UIKit

extension UITextField{
    func applyPlaceholderStyle(){
        self.font = TextStyles.Placeholder.medium
        self.textColor = ColorStyles.Text.gray_400
    }
}
