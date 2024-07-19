//
//  ProfileTableView.swift
//  final_project
//
//  Created by Nihad on 13.07.24.
//

import UIKit
import FirebaseAuth

enum ProfileSettingsImage{
    case notification
    case change_language
    case dark_mode
    case update_mobile_number
    case update_profile
    case change_password
    case about
    case tickets
    case terms_conditions
    case help
    case qr
    case block_card
    case logout
    
    var image: UIImage!{
        switch self {
        case .notification:
            return UIImage(named: "bell-02")
        case .change_language:
            return UIImage(named: "user-02")
        case .dark_mode:
            return UIImage(named: "sun")
        case .update_mobile_number:
            return UIImage(named: "phone-01")
        case .update_profile:
            return UIImage(named: "user-02")
        case .change_password:
            return UIImage(named: "lock-03")
        case .about:
            return UIImage(named: "info-circle")
        case .tickets:
            return UIImage(named: "ticket-01")
        case .terms_conditions:
            return UIImage(named: "shield-02")
        case .help:
            return UIImage(named: "help-circle")
        case .qr:
            return UIImage(named: "qr_code")
        case .block_card:
            return UIImage(named: "lock-03")
        case .logout:
            return UIImage(named: "log-out-01")
        }
    }
}

enum ProfileSection{
    case profileInformation
    case accountBalance
    case settings
    case logout
}
enum ProfileItemType{
    case profileInformationCell(ProfileInformationTableViewCell.Item)
    case accountBalanceCell(AccountBalanceBannerTableViewCell.Item)
    case settingsCell(SettingsTableViewCell.Item)
    case logoutCell(LogoutTableViewCell.Item)
}
struct ProfileSectionModel{
    let headerTitle: String?
    let headerSection: ProfileSection
    let items: [ProfileItemType]
}

class ProfileTableView: UITableView{
    
    private var sections: [ProfileSectionModel] = [] {
        didSet{
            reloadData()
        }
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize{
        self.contentSize
    }
    
    override var contentSize: CGSize{
        didSet{
            self.invalidateIntrinsicContentSize()
        }
    }
    func configure(_ sections: [ProfileSectionModel]){
        self.sections = sections
    }
    
    private func setup(){
        delegate = self
        dataSource = self
        register(ProfileInformationTableViewCell.self, forCellReuseIdentifier: ProfileInformationTableViewCell.identifier)
        register(AccountBalanceBannerTableViewCell.self, forCellReuseIdentifier: AccountBalanceBannerTableViewCell.identifier)
        register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        register(LogoutTableViewCell.self, forCellReuseIdentifier: LogoutTableViewCell.identifier)
        separatorStyle = .none
        
        
    }
}
extension ProfileTableView: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        let item = section.items[indexPath.row]
        
        switch item {
        case .profileInformationCell(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileInformationTableViewCell.identifier) as! ProfileInformationTableViewCell
            cell.noSelectionStyle()
            cell.configure(model)
            return cell
        case .accountBalanceCell(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: AccountBalanceBannerTableViewCell.identifier) as! AccountBalanceBannerTableViewCell
            cell.noSelectionStyle()
            cell.configure(model)
            return cell
        case .settingsCell(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier) as! SettingsTableViewCell
            cell.noSelectionStyle()
            cell.configure(model)
            return cell
        case .logoutCell(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: LogoutTableViewCell.identifier) as! LogoutTableViewCell
            cell.noSelectionStyle()
            cell.configure(model)
            return cell
        }
        
    }
    
}

extension ProfileTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let sectionModel = sections[section]
        
        return sectionModel.headerTitle == nil ? 0 : 32
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionModel = sections[section]
        let header = ProfileHeaderView()
        header.headerLabel.text = sectionModel.headerTitle
        return header
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = sections[indexPath.section]
        let item = section.items[indexPath.row]
        
        switch item {
        case .logoutCell:
            let auth = Auth.auth()
            do {
                try auth.signOut()
                transitionToSignin()
            } catch {
                print("Error", error.localizedDescription)
            }
        default:
            break
        }
    }
    
    private func transitionToSignin() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            return
        }
        UserDefaults.standard.removeObject(forKey: "UserAlreadySignedIn")
        let signInVC = OnboardingViewController()
        window.rootViewController = UINavigationController(rootViewController: signInVC)
        UIView.transition(with: window, duration: 0.5, options: .autoreverse, animations: nil, completion: nil)
    }
}

