//
//  ProfileHeaderView.swift
//  final_project
//
//  Created by Nihad on 13.07.24.
//

import UIKit

class ProfileHeaderView: UIView {
    let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    let headerLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorStyles.Text.gray_300
        label.font = TextStyles.Title.medium
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        configuratedConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(bgView)
        bgView.addSubview(headerLabel)
    }
    private func configuratedConstraints() {
        bgView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(0)
        }
        headerLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(0)
            make.top.bottom.equalToSuperview().inset(4)
        }
    }
    
}
