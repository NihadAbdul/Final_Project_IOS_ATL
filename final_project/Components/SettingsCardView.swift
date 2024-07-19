//
//  SettingsCardView.swift
//  final_project
//
//  Created by Nihad on 13.07.24.
//

import UIKit

class SettingsCardView: UIView{
    
    private let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorStyles.Background.buttonBackground
        view.layer.cornerRadius = 8
        return view
    }()
    private let leftImageTitleStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.horizontal(spacing: 8))
        return sv
    }()
    let leftImageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = TextStyles.Subtitle.medium
        label.textColor = ColorStyles.Text.gray_500
        return label
    }()
    private let rightImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "chevron-right")
        return iv
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
        addSubview(mainView)
        mainView.addSubview(leftImageTitleStackView)
        [
            leftImageView,
            titleLabel,
            rightImageView
        ].forEach(leftImageTitleStackView.addArrangedSubview)
    }
    private func configuratedContraints(){
    
        mainView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(0)
            make.top.bottom.equalToSuperview().inset(4)
        }
        leftImageTitleStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
        leftImageView.snp.makeConstraints { make in
            make.size.equalTo(18)
        }
        rightImageView.snp.makeConstraints { make in
            make.size.equalTo(18)
        }
    }
}
