//
//  CardsCollectionViewCell.swift
//  final_project
//
//  Created by Nihad on 05.06.24.
//

import UIKit
import ScalingCarousel

class CardsCollectionViewCell: UICollectionViewCell{
     
    private let cardView: CardsFrontView = {
        let view = CardsFrontView()
        return view
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
        contentView.addSubview(cardView)
    }
    private func configuratedContraints(){
        cardView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(0)
        }
    }
}
