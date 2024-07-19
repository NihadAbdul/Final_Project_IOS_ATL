//
//  SettingsTableViewCell.swift
//  final_project
//
//  Created by Nihad on 13.06.24.
//

import UIKit

final class SettingsTableViewCell: UITableViewCell{
    private let settingCard: SettingsCardView = {
        let view = SettingsCardView()
        return view
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
        contentView.addSubview(settingCard)
    }
    private func configuratedContraints(){
        settingCard.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(0)
        }
    }

}
extension SettingsTableViewCell{
    struct Item{
        let title: String
        let icon: ProfileSettingsImage
    }
    func configure(_ item: Item){
        self.settingCard.titleLabel.text = item.title
        self.settingCard.leftImageView.image = item.icon.image
    }
}
