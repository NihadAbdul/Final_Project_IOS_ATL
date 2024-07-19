//
//  SearchPredictionsTableViewCell.swift
//  final_project
//
//  Created by Nihad on 01.07.24.
//

import UIKit

class SearchPredictionsTableViewCell: UITableViewCell{
    
    private let bgView: UIView = {
        let view = UIView()
        return view
    }()
    private let leftIconTitleStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.horizontal(spacing: 8))
        return sv
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorStyles.Text.gray_500
        label.font = TextStyles.Title.medium
        return label
    }()
    private let imageBackgroundView: UIView = {
        let iv = UIView()
        iv.backgroundColor = ColorStyles.BaseColor.brand_secondary
        iv.layer.cornerRadius = 14
        return iv
    }()
    private let destionationImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "clock")
        iv.tintColor = ColorStyles.BaseColor.brand
        return iv
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
        bgView.addSubview(leftIconTitleStackView)
        
        imageBackgroundView.addSubview(destionationImageView)
        [
            imageBackgroundView,
            titleLabel
        ].forEach(leftIconTitleStackView.addArrangedSubview)
    }
    private func configuratedContraints(){
        bgView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(0)
        }
        leftIconTitleStackView.snp.makeConstraints { make in
            make.edges.equalTo(contentView.snp.edges).inset(8)
        }
        destionationImageView.snp.makeConstraints { make in
            make.edges.equalTo(imageBackgroundView.snp.edges).inset(8)
            make.size.equalTo(16)
        }
    }
    func configure(_ item: ResultModel.Item){
        self.titleLabel.text = item.title
    }
}
