//
//  SuccessViewController.swift
//  final_project
//
//  Created by Nihad on 04.06.24.
//

import UIKit
import SPConfetti


class SuccessViewController: UIViewController {
    
    private var list: SuccessModel.Item = .init(title: "Congratulations!!! You’re Signed In and Ready to Go", description: "You’ve signed in successfully. Dive into your account to discover new features, catch up on updates, and continue where you left off. ", img: "success_page")
    
    private let imageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "success_page")
        return img
    }()
    private let containerStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.vertical(spacing: 8, alignment: .fill, distribution: .equalCentering))
        return sv
    }()
    private let contentStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.vertical(spacing: 8, alignment: .fill, distribution: .fill))
        return sv
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.applyTitleStyle()
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.applyDescriptionStyle()
        label.textAlignment = .center
        return label
    }()
    private lazy var continueButton: CustomButton = {
        let button = CustomButton()
        button.configure(.init(title: "Continue", type: .primary))
        button.addTarget(self, action: #selector(didTapContinueButton), for: .touchUpInside)
        return button
    }()
    @objc
    private func didTapContinueButton(){
        let vc = SignInViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        SPConfetti.startAnimating(.centerWidthToDown, particles: [.triangle, .arc], duration: 2)
        setup()
        configuratedContraints()
        configure(list)
    }
    private func setup(){
        view.addSubview(containerStackView)
        [
            imageView,
            contentStackView,
            continueButton
        ].forEach(containerStackView.addArrangedSubview)
        [
            titleLabel,
            descriptionLabel
        ].forEach(contentStackView.addArrangedSubview)
    }
    private func configuratedContraints(){
        containerStackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.centerY.equalTo(view.safeAreaLayoutGuide)
        }
        imageView.snp.makeConstraints { make in
            make.size.equalTo(350)
        }
    }
    private func configure(_ item: SuccessModel.Item){
        self.titleLabel.text = item.title
        self.descriptionLabel.text = item.description
        self.imageView.image = UIImage(named: item.img)
    }
}
struct SuccessModel{
    struct Item{
        let title: String
        let description: String
        let img: String
    }
}
