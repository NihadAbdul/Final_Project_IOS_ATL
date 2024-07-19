//
//  CustomThirdPartiesButton.swift
//  final_project
//
//  Created by Nihad on 03.06.24.
//

import UIKit

class CustomThirdPartiesButton: UIView{
    
    private let thirdPartiesButtonView: UIView = {
        let view = UIView()
        view.applyButtonBackground()
        view.layer.cornerRadius = 12
        return view
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.applyCustomButtonTitle()
        return label
    }()
    private let leftImageView: UIImageView = {
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
    private func setup(){
        addSubview(thirdPartiesButtonView)
        thirdPartiesButtonView.addSubview(leftImageView)
        thirdPartiesButtonView.addSubview(titleLabel)
    }
    private func configuratedContraints(){
        thirdPartiesButtonView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        leftImageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(20)
            make.leading.equalToSuperview().inset(16)
        }
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
extension CustomThirdPartiesButton{
    struct Item{
        let title: String
        let image: String
    }
    func configure(_ item: Item){
        titleLabel.text = item.title
        leftImageView.image = UIImage(named: item.image)
    }
    
}
