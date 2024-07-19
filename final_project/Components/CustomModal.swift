//
//  CustomModal.swift
//  final_project
//
//  Created by Nihad on 17.06.24.
//

import UIKit

protocol CustomModalViewDelegate: AnyObject{
    func didTapCancelButton()
    func didTapPayButton()
}

class CustomModal: UIView{
    
    weak var delegate: CustomModalViewDelegate?
    
    private let transparentBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .init(red: 0, green: 0, blue: 0, alpha: 0.7)
        return view
    }()
    private let modalView: UIView = {
        let view = UIView()
        return view
    }()
    private let modalImageContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorStyles.Background.white
        view.layer.cornerRadius = 51
        view.layer.borderWidth = 6
        view.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.7)
        return view
    }()
    private let modalImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "money")
        return iv
    }()
    private let modalContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        return view
    }()
    private let contentStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.vertical(spacing: 16))
        return sv
    }()
    private let headerTitleSubtitleStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.vertical(spacing: 8, alignment: .center, distribution: .fillProportionally))
        return sv
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = TextStyles.Title.large
        label.textColor = ColorStyles.Text.gray_500
        label.text = "QR Payment"
        return label
    }()
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = TextStyles.Description.small
        label.textColor = ColorStyles.Text.gray_300
        label.text = "You should pay 1 Azn to get QR Code. It will last 5 minute for usage."
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    private let seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorStyles.Background.lineBackground
        view.isHidden = true
        return view
    }()
    private let amountStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.vertical(spacing: 8, alignment: .fill, distribution: .fillProportionally))
        return sv
    }()
    private let availableAmountStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.horizontal(spacing: 8, distribution: .fill))
        sv.isHidden = true
        return sv
    }()
    private let amountTextField: CustomInputTextField = {
        let tf = CustomInputTextField()
        tf.configure(.init(title: "Amount", placeholder: "Add amount", image: nil, leadingImageName: nil, trailingImageName: nil))
        
        return tf
    }()
    private let selectCardTextField: CustomInputTextField = {
        let tf = CustomInputTextField()
        tf.configure(.init(title: "Card", placeholder: "Select card", image: .trailing, leadingImageName: nil, trailingImageName: "chevron-down"))
        return tf
    }()
    private let blockedAmountStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.horizontal(spacing: 8, distribution: .fill))
        sv.isHidden = true
        return sv
    }()
    private let totalAmountStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.horizontal(spacing: 8, distribution: .fill))
        sv.isHidden = true
        return sv
    }()
    private let availableAmountLabel: UILabel = {
        let label = UILabel()
        label.font = TextStyles.Subtitle.small
        label.textColor = ColorStyles.Text.gray_300
        label.text = "Available amount:"
        return label
    }()
    private let availableAmountNumberLabel: UILabel = {
        let label = UILabel()
        label.font = TextStyles.Title.small
        label.textColor = ColorStyles.Text.gray_500
        label.text = "12 AZN"
        label.textAlignment = .right
        return label
    }()
    private let blockedAmountLabel: UILabel = {
        let label = UILabel()
        label.font = TextStyles.Subtitle.small
        label.textColor = ColorStyles.Text.gray_300
        label.text = "Blocked amount:"
        return label
    }()
    private let blockedAmountNumberLabel: UILabel = {
        let label = UILabel()
        label.font = TextStyles.Title.small
        label.textColor = ColorStyles.Text.gray_500
        label.text = "0 AZN"
        label.textAlignment = .right
        return label
    }()
    private let totalAmountLabel: UILabel = {
        let label = UILabel()
        label.font = TextStyles.Subtitle.small
        label.textColor = ColorStyles.Text.gray_300
        label.text = "Total: amount:"
        return label
    }()
    private let totalAmountNumberLabel: UILabel = {
        let label = UILabel()
        label.font = TextStyles.Title.small
        label.textColor = ColorStyles.Text.gray_500
        label.text = "12 AZN"
        label.textAlignment = .right
        return label
    }()
    private let buttonStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.horizontal(spacing: 8, alignment: .fill, distribution: .fillEqually))
        return sv
    }()
    private lazy var cancelButton: CustomButton = {
        let button = CustomButton()
        button.configure(.init(title: "Cancel", type: .secondary))
        button.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
        return button
    }()
    private lazy var payButton: CustomButton = {
        let button = CustomButton()
        button.configure(.init(title: "Pay", type: .primary))
        button.addTarget(self, action: #selector(didTapPayButton), for: .touchUpInside)
        return button
    }()
    @objc
    private func didTapCancelButton(){
        delegate?.didTapCancelButton()
    }
    @objc
    private func didTapPayButton(){
        delegate?.didTapPayButton()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        configuratedContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(){
        addSubview(transparentBackground)
        transparentBackground.addSubview(modalView)
        modalView.addSubview(modalContentView)
        modalView.addSubview(modalImageContainerView)
        modalImageContainerView.addSubview(modalImageView)
        modalContentView.addSubview(contentStackView)
        [
            headerTitleSubtitleStackView,
            amountStackView,
            buttonStackView
        ].forEach(contentStackView.addArrangedSubview)
        [
            titleLabel,
            descriptionLabel
        ].forEach(headerTitleSubtitleStackView.addArrangedSubview)
        [
            amountTextField,
            selectCardTextField,
            seperatorView,
            availableAmountStackView,
            blockedAmountStackView,
            totalAmountStackView
        ].forEach(amountStackView.addArrangedSubview)
        [
            availableAmountLabel,
            availableAmountNumberLabel
        ].forEach(availableAmountStackView.addArrangedSubview)
        [
            blockedAmountLabel,
            blockedAmountNumberLabel
        ].forEach(blockedAmountStackView.addArrangedSubview)
        [
            totalAmountLabel,
            totalAmountNumberLabel
        ].forEach(totalAmountStackView.addArrangedSubview)
        [
            cancelButton,
            payButton
        ].forEach(buttonStackView.addArrangedSubview)
    }
    private func configuratedContraints(){
        transparentBackground.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(0)
        }
        modalImageContainerView.snp.makeConstraints { make in
            make.bottom.equalTo(modalContentView.snp.top).inset(48)
            make.centerX.equalToSuperview()
        }
        modalImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(24)
            make.size.equalTo(54)
        }
        modalView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(32)
            make.centerY.equalToSuperview()
        }
        modalContentView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(0)
        }
        contentStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(56)
            make.leading.trailing.bottom.equalToSuperview().inset(16)
        }
        seperatorView.snp.makeConstraints { make in
            make.height.equalTo(4)
        }
    }
}
