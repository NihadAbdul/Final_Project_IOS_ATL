//
//  CustomButton.swift
//  final_project
//
//  Created by Nihad on 31.05.24.
//

import UIKit
import SnapKit

enum ButtonType{
    case primary
    case secondary
    case tertiary
    case brand_light
}
class CustomButton: UIView{
    
   private let customButton: UIButton = {
       let btn = UIButton()
       btn.layer.cornerRadius = 27
       return btn
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        configuratedContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setup(){
        addSubview(customButton)
    }
    func configuratedContraints(){
        customButton.snp.makeConstraints { make in
            make.edges.equalToSuperview().offset(0)
            make.height.equalTo(54)
        }
    }
}
extension CustomButton{
    struct Item{
        let title: String
        let type: ButtonType
    }
    func configure(_ item: Item){
        customButton.setTitle(item.title, for: .normal)
        switch item.type{
        case .primary:
            customButton.applyPrimaryStyle()
        case .secondary:
            customButton.applySecondaryStyle()
        case .tertiary:
            customButton.applyTertiaryStyle()
            customButton.contentHorizontalAlignment = .right
        case .brand_light:
            customButton.applyLightStyle()
            var config = UIButton.Configuration.plain()
                   config.imagePadding = 6
            customButton.configuration = config
            
        }
    }
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
        customButton.addTarget(target, action: action, for: controlEvents)
    }
    func setImage(image: UIImage?, state: UIControl.State){
        customButton.setImage(image, for: state)
    }
}
