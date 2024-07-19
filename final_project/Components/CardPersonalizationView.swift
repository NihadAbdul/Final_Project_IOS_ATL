//
//  CardPersonalizationView.swift
//  final_project
//
//  Created by Nihad on 13.07.24.
//

import UIKit

class CardPersonalizationView: UIView{
    
    private let containerView: UIView = {
        let view = UIView()
        view.layer.borderColor = ColorStyles.Border.gray_100?.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 12
        return view
    }()
    private let titleSubtitleStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.vertical(spacing: 8, alignment: .center ,distribution: .fillProportionally))
        return sv
    }()
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = TextStyles.Title.medium
        label.textColor = ColorStyles.Text.gray_500
        return label
    }()
    var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = TextStyles.Title.small
        label.textColor = ColorStyles.Text.gray_300
        return label
    }()
    let statusView: StatusTagView = {
        let sv = StatusTagView()
        sv.isHidden = true
        return sv
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
        addSubview(containerView)
        containerView.addSubview(titleSubtitleStackView)
        
        [
            subtitleLabel,
            titleLabel,
            statusView
        ].forEach(titleSubtitleStackView.addArrangedSubview)
        
    }
    private func configuratedContraints(){
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(0)
        }
        titleSubtitleStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(12)
            make.top.bottom.equalToSuperview().inset(12)
        }
    }
}
//extension CardPersonalizationView{
//    struct Item{
//        let title: String?
//        let subtitle: String
//    }
//    func configure(_ item: Item){
//        self.titleLabel.text = item.title
//        self.subtitleLabel.text = item.subtitle
//    }
//}
