//
//  CardBackView.swift
//  final_project
//
//  Created by Nihad on 13.07.24.
//

import UIKit

class CardBackView: UIView{
    
    private let cardMainView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorStyles.BaseColor.brand_darker
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    private let contentStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.horizontal(spacing: 8, distribution: .fillEqually))
        return sv
    }()
    private let cardTypeRightImagesStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.vertical(spacing: 8, alignment: .trailing, distribution: .equalSpacing))
        return sv
    }()
    private let cardNameNumberStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.vertical(spacing: 4, alignment: .leading, distribution: .fill))
        return sv
    }()
    private let cardTitleSubtitleStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.vertical(spacing: 4, distribution: .fill))
        return sv
    }()
    private let cardNameTitleSubtitleStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.vertical(spacing: 4, distribution: .equalCentering))
        return sv
    }()
    private let rightLogoImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "logo")
        return iv
    }()
    private let rightNameHideInfoImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "eye")
        return iv
    }()
    private let cardSubtitleLabel: UILabel = {
        let label = UILabel()
        label.font = TextStyles.Subtitle.medium
        label.text = "Card"
        label.textColor = ColorStyles.Text.brand_lighter
        return label
    }()
    let cardTypeTitleLabel: UILabel = {
        let label = UILabel()
        label.font = TextStyles.Title.medium
        label.textColor = ColorStyles.Text.white
        return label
    }()
    private let cardNumberSubtitleLabel: UILabel = {
        let label = UILabel()
        label.font = TextStyles.Subtitle.medium
        label.text = "Card number"
        label.textColor = ColorStyles.Text.brand_lighter
        return label
    }()
    let cardNumberTitleLabel: UILabel = {
        let label = UILabel()
        label.font = TextStyles.Title.medium
        label.textColor = ColorStyles.Text.white
        return label
    }()
    private let backgroundPatternImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Ornament_back")
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
        addSubview(cardMainView)
        cardMainView.addSubview(contentStackView)
        [
            backgroundPatternImageView
        ].forEach(cardMainView.addSubview)
        [
            cardNameTitleSubtitleStackView,
            cardTypeRightImagesStackView
        ].forEach(contentStackView.addArrangedSubview)
        [
            cardNameNumberStackView,
            cardTitleSubtitleStackView
        ].forEach(cardNameTitleSubtitleStackView.addArrangedSubview)
        [
            cardSubtitleLabel,
            cardTypeTitleLabel
        ].forEach(cardNameNumberStackView.addArrangedSubview)
        [
            cardNumberSubtitleLabel,
            cardNumberTitleLabel
        ].forEach(cardTitleSubtitleStackView.addArrangedSubview)
        [
            rightLogoImageView,
            rightNameHideInfoImageView
            
        ].forEach(cardTypeRightImagesStackView.addArrangedSubview)
        
    }
    private func configuratedContraints(){
        cardMainView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(0)
            make.height.equalTo(190)
        }
        contentStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
        rightLogoImageView.snp.makeConstraints { make in
            make.size.equalTo(20)
        }
        rightNameHideInfoImageView.snp.makeConstraints { make in
            make.size.equalTo(24)
        }
        backgroundPatternImageView.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview().inset(0)
        }
    }
}

