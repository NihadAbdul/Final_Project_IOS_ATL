//
//  OnboardingCollectionViewCell.swift
//  final_project
//
//  Created by Nihad on 02.06.24.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell{
    
    private let imageView: UIImageView = {
        let img = UIImageView()
        return img
    }()
    private let contentStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.vertical(spacing: 8, alignment: .center, distribution: .fill))
        return sv
    }()
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.applySubtitleStyle()
        return label
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.applyTitleStyle()
        return label
    }()
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.applyDescriptionStyle()
        label.textAlignment = .center
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

        contentView.addSubview(imageView)
        contentView.addSubview(contentStackView)
        
        [
            subtitleLabel,
            titleLabel,
            descriptionLabel
        ].forEach(contentStackView.addArrangedSubview)
    }
    private func configuratedContraints(){
        contentStackView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).inset(24)
            make.leading.trailing.equalTo(contentView.safeAreaLayoutGuide)
        }
        imageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide)
            make.size.equalTo(350)
        }
    }
    func configure(_ item: OnboardingModel.Item){
        self.titleLabel.text = item.title
        self.subtitleLabel.text = item.subtitle
        self.descriptionLabel.text = item.description
        self.imageView.image = UIImage(named: item.img)
    }
}

    

