//
//  CardDetailsTableView.swift
//  final_project
//
//  Created by Nihad on 14.07.24.
//

import UIKit

enum CardDetailsSection{
    case cardBackView
    case cardSettings
    case deleteCard
}
enum CardDetailsItemType{
    case cardBackView(CardBackViewTableViewCell.Item)
    case cardSettings(CardSettingsTableViewCell.Item)
    case deleteCard(DeleteCardTableViewCell.Item)
    
}
struct CardDetailsSectionModel{
    let headerSection: CardDetailsSection
    let items: [CardDetailsItemType]
}

class CardDetailsTableView: UITableView{
    
    private var sections: [CardDetailsSectionModel] = [] {
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
    func configure(_ sections: [CardDetailsSectionModel]){
        self.sections = sections
    }
    
    private func setup(){
        dataSource = self
        register(CardBackViewTableViewCell.self, forCellReuseIdentifier: CardBackViewTableViewCell.identifier)
        register(CardSettingsTableViewCell.self, forCellReuseIdentifier: CardSettingsTableViewCell.identifier)
        register(DeleteCardTableViewCell.self, forCellReuseIdentifier: DeleteCardTableViewCell.identifier)
        separatorStyle = .none
    }
}
extension CardDetailsTableView: UITableViewDataSource{
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
            
        case .cardBackView(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: CardBackViewTableViewCell.identifier) as! CardBackViewTableViewCell
            cell.configure(model)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                cell.flipAnimation()
            }
            cell.noSelectionStyle()
            return cell
            
        case .cardSettings(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: CardSettingsTableViewCell.identifier) as! CardSettingsTableViewCell
            cell.configure(model)
            cell.noSelectionStyle()
            return cell
            
        case .deleteCard(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: DeleteCardTableViewCell.identifier) as! DeleteCardTableViewCell
            cell.configure(model)
            cell.noSelectionStyle()
            return cell
        }
    }
}

