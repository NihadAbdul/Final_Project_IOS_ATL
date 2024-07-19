//
//  SearchResultTableViewCell.swift
//  final_project
//
//  Created by Nihad on 05.07.24.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell{
    
    private let cellView: UIView = {
        let view = UIView()
        view.applyBorderStyle()
        return view
    }()
    private let imageViewTitlesStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.horizontal(spacing: 16))
        return sv
    }()
    private let leftTitleSubtitleStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.vertical(spacing: 8))
        return sv
    }()
    private let rightTitleSubtitleStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.vertical(spacing: 8, alignment: .trailing))
        return sv
    }()
    private let leftImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "wifi")
        return iv
    }()
    private let leftUpperTitleLabel: UILabel = {
        let label = UILabel()
        label.applyCardTitle()
        label.textColor = ColorStyles.Text.gray_500
        return label
    }()
    private let leftDownTitleLabel: UILabel = {
        let label = UILabel()
        label.applySubtitleStyle()
        label.textColor = ColorStyles.Text.gray_500
        return label
    }()
    private let rightUpperTitleLabel: UILabel = {
        let label = UILabel()
        label.applyCardTitle()
        label.textColor = ColorStyles.Text.gray_500
        return label
    }()
    private let rightDownTitleLabel: UILabel = {
        let label = UILabel()
        label.applySubtitleStyle()
        label.textColor = ColorStyles.Text.gray_300
        return label
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
        contentView.addSubview(cellView)
        [imageViewTitlesStackView].forEach(cellView.addSubview)
        [
            leftImageView,
            leftTitleSubtitleStackView,
            rightTitleSubtitleStackView
        ].forEach(imageViewTitlesStackView.addArrangedSubview)
        
        [
            leftUpperTitleLabel,
            leftDownTitleLabel
        ].forEach(leftTitleSubtitleStackView.addArrangedSubview)
        [
            rightUpperTitleLabel,
            rightDownTitleLabel
        ].forEach(rightTitleSubtitleStackView.addArrangedSubview)
        
    }
    private func configuratedContraints(){
        cellView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(0)
            make.top.bottom.equalToSuperview().inset(4)
        }
        imageViewTitlesStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
        leftImageView.snp.makeConstraints { make in
            make.size.equalTo(48)
        }
    }
    
    func configure(_ item: SearchResultModel.Item){
        self.leftUpperTitleLabel.text = item.location
        self.leftDownTitleLabel.text = item.bus
        self.rightUpperTitleLabel.text = item.time
        self.rightDownTitleLabel.text = item.nearby
        self.leftImageView.image = UIImage(named: item.icon)
    }
}

