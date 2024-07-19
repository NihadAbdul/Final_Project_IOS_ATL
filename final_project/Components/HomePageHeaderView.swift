//
//  HomePageHeaderView.swift
//  final_project
//
//  Created by Nihad on 06.06.24.
//

import UIKit

class HomePageHeaderView: UIView {
    
    private let imageTitleSubtitleStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.horizontal(spacing: 8, alignment: .center))
        return sv
    }()
    private let titleSubtitleLabelStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.vertical(spacing: 4, alignment: .center ))
        return sv
    }()
    private let leftImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Profile-Image")
        iv.layer.cornerRadius = 20
        iv.clipsToBounds = true
        return iv
    }()
    private let rightImageBackgroundView: UIView = {
        let bv = UIView()
        bv.backgroundColor = ColorStyles.Background.cardBackground
        bv.layer.cornerRadius = 18
        return bv
    }()
    private let rightImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "bell-01")
        iv.tintColor = .white
        return iv
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.applyHeaderTitleStyle()
        label.text = "Hello, Nihad"
        return label
    }()
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.applyControllerSubtitleStyle()
        label.text = "Let’s go on an adventure"
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
            leftImageView,
            titleSubtitleLabelStackView,
            rightImageBackgroundView
        ].forEach(imageTitleSubtitleStackView.addArrangedSubview)
        [
            subtitleLabel,
            titleLabel
        ].forEach(titleSubtitleLabelStackView.addArrangedSubview)
        [
            rightImageView
        ].forEach(rightImageBackgroundView.addSubview)
    }
    private func configuratedContraints(){
        imageTitleSubtitleStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
        leftImageView.snp.makeConstraints { make in
            make.size.equalTo(40)
        }
        rightImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
            make.size.equalTo(18)
        }
    }
}
