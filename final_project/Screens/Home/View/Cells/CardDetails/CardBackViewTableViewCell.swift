//
//  CardBackViewTableViewCell.swift
//  final_project
//
//  Created by Nihad on 13.07.24.
//

import UIKit

final class CardBackViewTableViewCell: UITableViewCell{
    
    private var cardViewForAnimation: UIView = {
        let view = UIView()
        return view
    }()
    private var cardBackView: CardBackView = {
        let view = CardBackView()
        return view
    }()
    private let cardFrontView: CardsFrontView = {
        let view = CardsFrontView()
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
        contentView.addSubview(cardViewForAnimation)
        
        [cardFrontView,cardBackView].forEach(cardViewForAnimation.addSubview)
        cardBackView.isHidden = true
    }
    private func configuratedContraints(){
        cardViewForAnimation.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(0)
        }
        cardFrontView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(0)
        }
        cardBackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(0)
        }
    }
}
extension CardBackViewTableViewCell{
    struct Item{
        let cardBalance: String
        let cardNumber: String
    }
    func configure(_ item: Item){
        cardBackView.cardTypeTitleLabel.text = item.cardBalance
        cardBackView.cardNumberTitleLabel.text = item.cardNumber
    }
}
extension CardBackViewTableViewCell{
    
    func flipAnimation() {
            UIView.transition(from: cardFrontView, to: cardBackView, duration: 0.5, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
       
    }
}
