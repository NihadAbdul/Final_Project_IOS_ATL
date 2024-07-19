//
//  CardsFrontView.swift
//  final_project
//
//  Created by Nihad on 05.06.24.
//

import UIKit

class CardsFrontView: UIView{
    
    private let cardMainView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorStyles.Background.cardBackground
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorStyles.BaseColor.brand_darker
        return view
    }()
    private let cardTypeRightImageStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.horizontal(spacing: 8))
        return sv
    }()
    private let cardNameExpiredStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.horizontal(spacing: 8, alignment: .center, distribution: .equalSpacing))
        return sv
    }()
    private let cardTitleSubtitleStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.vertical(spacing: 4, distribution: .fillProportionally))
        return sv
    }()
    private let expiredTitleSubtitleStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.vertical(spacing: 4, distribution: .fillProportionally))
        return sv
    }()
    private let rightLogoImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "logo")
        return iv
    }()
    private let rightNameExpiredImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "wifi")
        return iv
    }()
    private let cardTitleLabel: UILabel = {
        let label = UILabel()
        label.applyCardTitle()
        label.text = "Digital card"
        return label
    }()
    private let cardSubtitleLabel: UILabel = {
        let label = UILabel()
        label.applySubtitleStyle()
        label.text = "Card"
        label.textColor = ColorStyles.Text.brand_lighter
        return label
    }()
    private let cardTypeTitleLabel: UILabel = {
        let label = UILabel()
        label.applySubtitleStyle()
        label.text = "Main"
        label.textColor = ColorStyles.Text.white
        return label
    }()
    private let expiredSubtitleLabel: UILabel = {
        let label = UILabel()
        label.applySubtitleStyle()
        label.text = "Expired"
        label.textColor = ColorStyles.Text.brand_lighter
        return label
    }()
    private let expiredTitleLabel: UILabel = {
        let label = UILabel()
        label.applySubtitleStyle()
        label.text = "None"
        label.textColor = ColorStyles.Text.white
        return label
    }()
    private let backgroundPatternImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Ornament")
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
        
        [
            backgroundPatternImageView,
            cardTypeRightImageStackView,
            contentView
        ].forEach(cardMainView.addSubview)
        [
            cardTitleLabel,
            rightLogoImageView
        ].forEach(cardTypeRightImageStackView.addArrangedSubview)
        [
            cardNameExpiredStackView
        ].forEach(contentView.addSubview)
        [
            cardTitleSubtitleStackView,
            expiredTitleSubtitleStackView,
            rightNameExpiredImageView
        ].forEach(cardNameExpiredStackView.addArrangedSubview)
        [
            cardSubtitleLabel,
            cardTypeTitleLabel
        ].forEach(cardTitleSubtitleStackView.addArrangedSubview)
        [
            expiredSubtitleLabel,
            expiredTitleLabel
        ].forEach(expiredTitleSubtitleStackView.addArrangedSubview)
    }
    private func configuratedContraints(){
        cardMainView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(0)
        }
        cardTypeRightImageStackView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(16)
        }
        contentView.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview().inset(0)
        }
        cardNameExpiredStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
        rightLogoImageView.snp.makeConstraints { make in
            make.size.equalTo(20)
        }
        rightNameExpiredImageView.snp.makeConstraints { make in
            make.size.equalTo(16)
        }
        contentView.snp.makeConstraints { make in
            make.height.equalTo(60)
        }
        backgroundPatternImageView.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview().inset(0)
        }
    }
}
