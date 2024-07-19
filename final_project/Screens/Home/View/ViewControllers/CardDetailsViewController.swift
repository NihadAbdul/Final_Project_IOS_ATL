//
//  CardDetailsViewController.swift
//  final_project
//
//  Created by Nihad on 13.07.24.
//

import UIKit

class CardDetailsViewController: UIViewController{
    
    private let cardDetailsTableView: CardDetailsTableView = {
        let tv = CardDetailsTableView()
        return tv
    }()
    private let addBalanceButton: CustomButton = {
        let button = CustomButton()
        button.configure(.init(title: "Add balance", type: .secondary))
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Card Details"
        
        setup()
        configuratedContraints()
    }
    
    private func setup(){
        view.addSubview(cardDetailsTableView)
        view.addSubview(addBalanceButton)
        cardDetailsTableView.configure([
            .init(headerSection: .cardBackView, items: [.cardBackView(.init(cardBalance: "15 Azn", cardNumber: "12368-1233-1"))]),
            .init(headerSection: .cardSettings, items: [
                .cardSettings(.init(title: "Block card", icon: .block_card)),
                .cardSettings(.init(title: "Generate QR", icon: .qr)),
                .cardSettings(.init(title: "Update Mobile Number", icon: .update_mobile_number)),
                .cardSettings(.init(title: "Help", icon: .help)),
                .cardSettings(.init(title: "Terms and Conditions", icon: .terms_conditions)),
            ]),
            .init(headerSection: .deleteCard, items: [.deleteCard(.init(title: "Delete card"))])
            
        ])
        
        cardDetailsTableView.showsVerticalScrollIndicator = false
        cardDetailsTableView.separatorStyle = .none
    }
    private func configuratedContraints(){
        cardDetailsTableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        addBalanceButton.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
    }
    
}

