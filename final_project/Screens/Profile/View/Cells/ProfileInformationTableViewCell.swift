//
//  ProfileInformationTableViewCell.swift
//  final_project
//
//  Created by Nihad on 12.06.24.
//

import UIKit

final class ProfileInformationTableViewCell: UITableViewCell{
    private let mainView: UIView = {
        let view = UIView()
        return view
    }()
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.vertical(spacing: 4, alignment: .center))
        return sv
    }()
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Profile-Image")
        iv.layer.cornerRadius = 50
        iv.clipsToBounds = true
        return iv
    }()
    private let fullnameTitleLabel: UILabel = {
        let label = UILabel()
        label.applyTitleStyle()
        return label
    }()
    private let phoneNumberSubtitleLabel: UILabel = {
        let label = UILabel()
        label.applyDescriptionStyle()
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
        contentView.addSubview(mainView)
        mainView.addSubview(stackView)
        [
            profileImageView,
            fullnameTitleLabel,
            phoneNumberSubtitleLabel
        ].forEach(stackView.addArrangedSubview)
    }
    private func configuratedContraints(){
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(0)
        }
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(0)
        }
        profileImageView.snp.makeConstraints { make in
            make.size.equalTo(100)
        }
    }
    
}
extension ProfileInformationTableViewCell{
    struct Item{
        let title: String
        let subtitle: String
    }
    func configure(_ item: Item){
        self.fullnameTitleLabel.text = item.title
        self.phoneNumberSubtitleLabel.text = item.subtitle
    }
}
