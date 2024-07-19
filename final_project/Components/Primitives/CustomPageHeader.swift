//
//  CustomPageHeader.swift
//  final_project
//
//  Created by Nihad on 02.06.24.
//

import UIKit

class CustomPageHeader: UIView{
    
    private let titleDescriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.apply(style: StackViewStyles.vertical(spacing: 4))
        return stackView
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.applyPageTitleStyle()
        return label
    }()
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.applyDescriptionStyle()
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
        addSubview(titleDescriptionStackView)
        
        [
            titleLabel,
            descriptionLabel
        ].forEach(titleDescriptionStackView.addArrangedSubview)
    }
    private func configuratedContraints(){
        titleDescriptionStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
extension CustomPageHeader{
    struct Item{
        let title: String
        let description: String
    }
    func configure(_ item: Item){
        titleLabel.text = item.title
        descriptionLabel.text = item.description
    }
}
