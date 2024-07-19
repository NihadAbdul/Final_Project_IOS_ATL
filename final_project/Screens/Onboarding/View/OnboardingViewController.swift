//
//  OnboardingViewController.swift
//  final_project
//
//  Created by Nihad on 31.05.24.
//

import UIKit
import SnapKit



class OnboardingViewController: UIViewController{
    
    private var viewModel = OnboardingViewModel()
    
    private var currentIndex: Int = 0
    
    private let headerStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.horizontal(spacing: 8))
        return sv
    }()
    private let buttonStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.horizontal(spacing: 8, distribution: .fillEqually))
        return sv
    }()
    private lazy var imageTitleSubtitleCollectionView: OnboardingCollectionView = {
        let cv = OnboardingCollectionView()
        cv.dataSource = self
        return cv
    }()
    private lazy var skipButton: CustomButton = {
        let button = CustomButton()
        button.configure(.init(title: "Skip", type: .tertiary))
        button.addTarget(self, action: #selector(didTapSkipButton), for: .touchUpInside)
        return button
    }()
    private lazy var nextButton: CustomButton = {
        let button = CustomButton()
        button.configure(.init(title: "Next", type: .primary))
        button.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        return button
    }()
    private lazy var backButton: CustomButton = {
        let button = CustomButton()
        button.configure(.init(title: "Back", type: .secondary))
        button.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        return button
    }()
    private lazy var getStartedButton: CustomButton = {
        let button = CustomButton()
        button.configure(.init(title: "Get started", type: .primary))
        button.addTarget(self, action: #selector(didTapGetStartedButton), for: .touchUpInside)
        return button
    }()
    
    @objc
    private func didTapSkipButton(){
        let vc = SignInViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc
    private func didTapNextButton(){
        if currentIndex < viewModel.list.count - 1{
            currentIndex += 1
            let indexPath = IndexPath(item: currentIndex, section: 0)
            imageTitleSubtitleCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            backButton.isHidden = false
        }
        if currentIndex == viewModel.list.count - 1{
            backButton.isHidden = true
            nextButton.isHidden = true
            getStartedButton.isHidden = false
        }
        
    }
    @objc
    private func didTapBackButton(){
        if currentIndex > 0 {
            currentIndex -= 1
            let indexPath = IndexPath(item: currentIndex, section: 0)
            imageTitleSubtitleCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            backButton.isHidden = true
        }
    }
    @objc
    private func didTapGetStartedButton(){
        let vc = SignInViewController()
        UserDefaults.standard.set(true, forKey: "UserPassedOnBoarding")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configuratedContraints()
        self.navigationController?.navigationBar.isHidden = true
    
        if UserDefaults.standard.bool(forKey: "UserPassedOnBoarding") == true{
            let vc = SignInViewController()
            self.navigationController?.pushViewController(vc, animated: false)
        }
    }
    
    func setup(){
        view.addSubview(headerStackView)
        view.addSubview(imageTitleSubtitleCollectionView)
        view.addSubview(buttonStackView)
        
        view.backgroundColor = .systemBackground
        
        [
            skipButton
        ].forEach(headerStackView.addArrangedSubview)
        [
            backButton,
            nextButton,
            getStartedButton
        ].forEach(buttonStackView.addArrangedSubview)
        
        backButton.isHidden = true
        getStartedButton.isHidden = true
        
        
    }
    
    func configuratedContraints(){
        headerStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        imageTitleSubtitleCollectionView.snp.makeConstraints { make in
            make.top.equalTo(headerStackView.snp.bottom).offset(70)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.height.equalTo(530)
        }
        buttonStackView.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
}
extension OnboardingViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.list.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.configure(viewModel.list[indexPath.row])
        return cell
    }
}
