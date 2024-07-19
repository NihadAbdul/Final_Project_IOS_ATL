//
//  CustomInputTextField.swift
//  final_project
//
//  Created by Nihad on 31.05.24.
//

import UIKit
import SnapKit

enum InputIconType{
    case leading
    case trailing
    case both
}
class CustomInputTextField: UIView{
    
    private let containerStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.vertical(spacing: 4))
        return sv
    }()
    private let inputBackgroundView: UIView = {
        let vw = UIView()
        vw.backgroundColor = UIColor(named: "input-background")
        vw.layer.cornerRadius = 12
        return vw
    }()
    private let inputTitleLabel: UILabel = {
        let label = UILabel()
        label.applyInputTitleStyle()
        return label
    }()
    private let textFieldLeftRightIconBackgroundStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.horizontal(spacing: 8))
        return sv
    }()
    let inputTextField: UITextField = {
        let tf = UITextField()
        tf.applyPlaceholderStyle()
        tf.autocorrectionType = .no
        return tf
    }()
    private let leftImageView: UIImageView = {
        let img = UIImageView()
        return img
    }()
    private let rightImageView: UIImageView = {
        let img = UIImageView()
        return img
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
        addSubview(containerStackView)
        
        inputBackgroundView.addSubview(textFieldLeftRightIconBackgroundStackView)
        
        [
            inputTitleLabel,
            inputBackgroundView
            
        ].forEach(containerStackView.addArrangedSubview)
        
        [
            leftImageView,
            inputTextField,
            rightImageView
            
        ].forEach(textFieldLeftRightIconBackgroundStackView.addArrangedSubview)
        
    }
    func configuratedContraints(){
        containerStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        inputBackgroundView.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        textFieldLeftRightIconBackgroundStackView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview().inset(16)
        }
        leftImageView.snp.makeConstraints { make in
            make.size.equalTo(18)
        }
        rightImageView.snp.makeConstraints { make in
            make.size.equalTo(18)
        }
    }
}
extension CustomInputTextField{
    struct Item{
        let title: String?
        let placeholder: String
        let image: InputIconType?
        let leadingImageName: String?
        let trailingImageName: String?
    }
    func configure(_ item: Item){
        inputTitleLabel.text = item.title
        inputTextField.placeholder = item.placeholder
        
        leftImageView.isHidden = true
        rightImageView.isHidden = true
        
        switch item.image {
        case .leading:
            leftImageView.isHidden = false
            if let leadingImageName = item.leadingImageName{
                leftImageView.image = UIImage(named: leadingImageName)
            }
        case .trailing:
            rightImageView.isHidden = false
            if let trailingImageName = item.trailingImageName{
                rightImageView.image = UIImage(named: trailingImageName)
            }
        case .both:
            leftImageView.isHidden = false
            rightImageView.isHidden = false
            
            if let leadingImageName = item.leadingImageName{
                leftImageView.image = UIImage(named: leadingImageName)
            }
            if let trailingImageName = item.trailingImageName{
                rightImageView.image = UIImage(named: trailingImageName)
            }
        case .none:
            return
        }
    }
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
        inputTextField.addTarget(target, action: action, for: controlEvents)
    }
}
