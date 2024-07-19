//
//  OnboardingCollectionView.swift
//  final_project
//
//  Created by Nihad on 02.06.24.
//

import UIKit

class OnboardingCollectionView: UICollectionView{
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let layout = UICollectionViewFlowLayout()
        let screenWidth = UIScreen.main.bounds.width - 48
        layout.itemSize = .init(width: screenWidth, height: 620)
        layout.scrollDirection = .horizontal
        super.init(frame: frame, collectionViewLayout: layout)
        setup()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(){
        register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: OnboardingCollectionViewCell.identifier)
        isScrollEnabled = false
        showsHorizontalScrollIndicator = false
    }
}
