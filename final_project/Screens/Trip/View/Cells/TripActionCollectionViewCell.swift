//
//  TripActionCollectionViewCell.swift
//  final_project
//
//  Created by Nihad on 20.06.24.
//

import UIKit

class TripActionCollectionViewCell: UICollectionViewCell{
    
    private let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 8
        return view
    }()
    private let titleIconStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.vertical(spacing: 8, alignment: .leading))
        return sv
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = TextStyles.Title.small
        label.textColor = ColorStyles.Text.gray_500
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private let actionIcon: UIImageView = {
        let iv = UIImageView()
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
        contentView.addSubview(bgView)
        bgView.addSubview(titleIconStackView)
        [
            actionIcon,
            titleLabel
        ].forEach(titleIconStackView.addArrangedSubview)
    }
    private func configuratedContraints(){
        bgView.snp.makeConstraints { make in
            make.edges.equalTo(contentView.snp.edges).inset(0)
        }
        titleIconStackView.snp.makeConstraints { make in
            make.leading.equalTo(bgView.snp.leading).inset(16)
            make.trailing.equalTo(bgView.snp.trailing).inset(16)
            make.top.equalTo(bgView.snp.top).inset(12)
            make.bottom.equalTo(bgView.snp.bottom).inset(12)
        }
        actionIcon.snp.makeConstraints { make in
            make.size.equalTo(24)
        }
    }
    func configure(_ item: TripModel.Item){
        self.actionIcon.image = UIImage(named: item.icon)
        self.titleLabel.text = item.title
    }
}
