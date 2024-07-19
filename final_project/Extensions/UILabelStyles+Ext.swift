//
//  UILabelStyles+Ext.swift
//  final_project
//
//  Created by Nihad on 02.06.24.
//

import UIKit
//protocol LabelStyles{
//    func applyTitleStyles(font: TextStyles, textColor: ColorStyles )
//    
//}
extension UILabel{
    func applyTitleStyle(){
        self.font = TextStyles.Title.large
        self.textColor = ColorStyles.Text.gray_500
    }
    func applyHeaderTitleStyle(){
        self.font = TextStyles.Title.medium
        self.textColor = ColorStyles.Text.white
    }
    func applyControllerSubtitleStyle(){
        self.font = TextStyles.Title.small
        self.textColor = ColorStyles.Text.white
    }
    func applyPageTitleStyle(){
        self.font = TextStyles.Title.large
        self.textColor = ColorStyles.Text.gray_500
    }
    func applySubtitleStyle(){
        self.font = TextStyles.Subtitle.small
        self.textColor = ColorStyles.Text.brand
    }
    func applyInputTitleStyle(){
        self.font = TextStyles.Title.medium
        self.textColor = ColorStyles.Text.gray_500
    }
    func applyDescriptionStyle(){
        self.font = TextStyles.Description.small
        self.textColor = ColorStyles.Text.gray_300
    }
    func applyCustomButtonTitle(){
        self.font = TextStyles.Button.large
        self.textColor = ColorStyles.Text.gray_500
    }
    func applyInformativeTitle(){
        self.font = TextStyles.Subtitle.medium
        self.textColor = ColorStyles.Text.gray_500
    }
    func applyCardTitle(){
        self.font = TextStyles.Title.medium
        self.textColor = ColorStyles.Text.white
    }
    func applyBannerTitleStyle(){
        self.font = TextStyles.Title.large
        self.textColor = ColorStyles.Text.white
    }
    func applyBannerSubtitleStyle(){
        self.font = TextStyles.Subtitle.small
        self.textColor = ColorStyles.Text.white
    }
}
