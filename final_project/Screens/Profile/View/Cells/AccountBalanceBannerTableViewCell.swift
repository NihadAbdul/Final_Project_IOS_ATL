//
//  AccountBalanceBannerTableViewCell.swift
//  final_project
//
//  Created by Nihad on 12.06.24.
//

import UIKit

final class AccountBalanceBannerTableViewCell: UITableViewCell{
    
    private let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorStyles.Background.cardBackground
        view.layer.cornerRadius = 8
        return view
    }()
    private let bgImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "Ornament-left")
        return img
    }()
    private let titlesButtonStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.horizontal(spacing: 8, alignment: .fill, distribution: .fillProportionally))
        return sv
    }()
    private let contentStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.vertical(spacing: 4, alignment: .fill, distribution: .fillEqually))
        return sv
    }()
    private let balanceSubtitleLabel: UILabel = {
        let label = UILabel()
        label.applyBannerSubtitleStyle()
        label.text = "Account balance"
        return label
    }()
    private let balanceTitleLabel: UILabel = {
        let label = UILabel()
        label.applyBannerTitleStyle()
        label.text = "15 AZN"
        return label
    }()
    private let addButton: CustomButton = {
        let button = CustomButton()
        button.configure(.init(title: "Add", type: .secondary))
        return button
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        configuratedContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setup(){
        contentView.addSubview(bgView)
        bgView.addSubview(bgImage)
        bgView.addSubview(titlesButtonStackView)
        [
            balanceSubtitleLabel,
            balanceTitleLabel
        ].forEach(contentStackView.addArrangedSubview)
        [
            contentStackView,
            addButton
        ].forEach(titlesButtonStackView.addArrangedSubview)
    }
    private func configuratedContraints(){
        bgView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(0)
            make.height.equalTo(86)
        }
        bgImage.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview().inset(0)
        }
        titlesButtonStackView.snp.makeConstraints { make in
            make.edges.equalTo(bgView).inset(16)
        }
    }

}
extension AccountBalanceBannerTableViewCell{
    struct Item{
        let title: String
        let subtitle: String
    }
    func configure(_ item: Item){
        self.balanceTitleLabel.text = item.title
        self.balanceSubtitleLabel.text = item.subtitle
    }
}
