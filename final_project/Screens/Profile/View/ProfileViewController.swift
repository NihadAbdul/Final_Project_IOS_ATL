//
//  ProfileViewController.swift
//  final_project
//
//  Created by Nihad on 08.06.24.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {
    
    private let profileTableView: ProfileTableView = {
        let tv = ProfileTableView()
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Profile"
        
        setup()
        configuratedContraints()
        
    }
    
    private func setup() {
        view.addSubview(profileTableView)
  
        profileTableView.configure([
            .init(headerTitle: nil, headerSection: .profileInformation, items: [
                .profileInformationCell(.init(title: "Nihad Abdulalizada", subtitle: "+9942002020"))
            ]),
            .init(headerTitle: nil, headerSection: .accountBalance, items: [
                .accountBalanceCell(.init(title: "15 Azn", subtitle: "Account Balance"))
            ]),
            .init(headerTitle: "General Settings", headerSection: .settings, items: [
                .settingsCell(.init(title: "Notification", icon: .notification)),
                .settingsCell(.init(title: "Change Language", icon: .change_language)),
                .settingsCell(.init(title: "Dark mode", icon: .dark_mode))
            ]),
            .init(headerTitle: "Security", headerSection: .settings, items: [
                .settingsCell(.init(title: "Update Mobile Number", icon: .update_mobile_number)),
                .settingsCell(.init(title: "Update Profile", icon: .update_profile)),
                .settingsCell(.init(title: "Change Password", icon: .change_password))
            ]),
            .init(headerTitle: "About BakuCard", headerSection: .settings, items: [
                .settingsCell(.init(title: "About BakuCard", icon: .about)),
                .settingsCell(.init(title: "Tickets and Tariffs", icon: .tickets))
            ]),
            .init(headerTitle: "Other", headerSection: .settings, items: [
                .settingsCell(.init(title: "Terms and Conditions", icon: .terms_conditions)),
                .settingsCell(.init(title: "Help", icon: .help))
            ]),
            .init(headerTitle: nil, headerSection: .logout, items: [
                .logoutCell(.init(title: "Logout"))
            ])
        ])
        profileTableView.showsVerticalScrollIndicator = false
        profileTableView.separatorStyle = .none
    }
    
    private func configuratedContraints() {
        profileTableView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.top.bottom.equalTo(view.safeAreaLayoutGuide).inset(0)
        }
    }
}





