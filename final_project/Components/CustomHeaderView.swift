//
//  CustomHeaderView.swift
//  final_project
//
//  Created by Nihad on 06.07.24.
//

import UIKit

class CustomHeaderView: UIView {
    
    private let imageTitleSubtitleStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.horizontal(spacing: 8, alignment: .fill, distribution: .fillProportionally))
        return sv
    }()
    private let titleSubtitleLabelStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.vertical(spacing: 4, alignment: .center ))
        return sv
    }()
    private let leftImageBackgroundView: UIView = {
        let bv = UIView()
        bv.layer.cornerRadius = 18
        return bv
    }()
    private let rightImageBackgroundView: UIView = {
        let bv = UIView()
        bv.layer.cornerRadius = 18
        return bv
    }()
    private let leftImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "chevron-left")
        return iv
    }()
    private let rightImageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = TextStyles.Title.large
        label.textColor = ColorStyles.Text.gray_500
        label.text = "Search"
        return label
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
        
        addSubview(imageTitleSubtitleStackView)
        
        [
            leftImageBackgroundView,
            titleSubtitleLabelStackView,
            rightImageBackgroundView
        ].forEach(imageTitleSubtitleStackView.addArrangedSubview)
        [
            titleLabel
        ].forEach(titleSubtitleLabelStackView.addArrangedSubview)
        [
            leftImageView
        ].forEach(leftImageBackgroundView.addSubview)
        [
            rightImageView
        ].forEach(rightImageBackgroundView.addSubview)
    }
    private func configuratedContraints(){
        imageTitleSubtitleStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(0)
            make.top.bottom.equalToSuperview().inset(4)
        }
        leftImageView.snp.makeConstraints { make in
            make.size.equalTo(24)
            make.edges.equalToSuperview().inset(4)
        }
        rightImageView.snp.makeConstraints { make in
            make.size.equalTo(24)
            make.edges.equalToSuperview().inset(4)
        }
    }
}
