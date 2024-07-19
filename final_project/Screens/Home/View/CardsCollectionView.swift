//
//  CardsCollectionView.swift
//  final_project
//
//  Created by Nihad on 05.06.24.
//
import UIKit


class CardsCollectionView: UICollectionView{
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let layout = UICollectionViewFlowLayout()
        let screenWidth = UIScreen.main.bounds.width - 32
        layout.itemSize = .init(width: screenWidth, height: 190)
        layout.scrollDirection = .horizontal
        super.init(frame: frame, collectionViewLayout: layout)
        setup()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(){
        register(CardsCollectionViewCell.self, forCellWithReuseIdentifier: CardsCollectionViewCell.identifier)
        isScrollEnabled = true
        showsHorizontalScrollIndicator = false
    }
}
