//
//  DeleteCardTableViewCell.swift
//  final_project
//
//  Created by Nihad on 14.07.24.
//

import UIKit

final class DeleteCardTableViewCell: UITableViewCell{
    
    private let mainView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        return view
    }()
    private let leftImageTitleStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.horizontal(spacing: 8))
        return sv
    }()
    private let leftImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "trash")
        return iv
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = TextStyles.Subtitle.medium
        label.textColor = .red
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
        mainView.addSubview(leftImageTitleStackView)
        [
            leftImageView,
            titleLabel,
        ].forEach(leftImageTitleStackView.addArrangedSubview)
    }
    private func configuratedContraints(){
        mainView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview().inset(0)
            make.bottom.equalToSuperview().inset(16)
        }
        leftImageTitleStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
        leftImageView.snp.makeConstraints { make in
            make.size.equalTo(16)
        }
    }
}
extension DeleteCardTableViewCell{
    struct Item{
        let title: String
    }
    func configure(_ item: Item){
        self.titleLabel.text = item.title
    }
}

