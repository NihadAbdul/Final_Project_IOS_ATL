//
//  StatusTagView.swift
//  final_project
//
//  Created by Nihad on 13.07.24.
//

import UIKit

enum StatusType{
    case active
    case blocked
    
    var image: UIImage!{
        switch self {
        case .active:
            return UIImage(named: "check-circle")
        case .blocked:
            return UIImage(named: "lock")
            
        }
    }
}

class StatusTagView: UIView{
    
    private let statusView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorStyles.BaseColor.success_secondary
        view.layer.cornerRadius = 14
        return view
    }()
    let statusStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.horizontal(spacing: 4, alignment: .center, distribution: .fill))
        return sv
    }()
    private let statusIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "check-circle")
        iv.tintColor = ColorStyles.BaseColor.success_primary
        return iv
    }()
    private let statusTitle: UILabel = {
        let label = UILabel()
        label.textColor = ColorStyles.BaseColor.success_primary
        label.text = "Active"
        label.font = TextStyles.Title.small
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
        addSubview(statusView)
        
        statusView.addSubview(statusStackView)
        
        [
            statusIconImageView,
            statusTitle
            
        ].forEach(statusStackView.addArrangedSubview)
    }
    private func configuratedContraints(){
        statusView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(0)
        }
        statusStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(4)
            make.leading.trailing.equalToSuperview().inset(8)
        }
        statusIconImageView.snp.makeConstraints { make in
            make.size.equalTo(16)
        }
    }
}
extension StatusTagView{
    struct Item{
        let title: String
        let status: StatusType
    }
    func configure(_ item: Item){
        self.statusTitle.text = item.title
        self.statusIconImageView.image = item.status.image
    }
}
