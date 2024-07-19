//
//  SearchResultViewController.swift
//  final_project
//
//  Created by Nihad on 05.07.24.
//

import UIKit

class SearchResultViewController: UIViewController{

    private let viewModel = SearchResultViewModel()
    
    private let resultCountTitle: UILabel = {
        let label = UILabel()
        label.font = TextStyles.Title.large
        label.textColor = ColorStyles.Text.gray_500
        label.text = "8 results founded"
        return label
    }()
    private let searchResultTableview: UITableView = {
        let tv = UITableView()
        tv.register(SearchResultTableViewCell.self, forCellReuseIdentifier: SearchResultTableViewCell.identifier)
        return tv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        popViewController()
        title = "Search result"
        
        setup()
        configuratedContraints()
        
    }
    private func setup(){
        view.addSubview(resultCountTitle)
        view.addSubview(searchResultTableview)
        
        searchResultTableview.dataSource = self
        searchResultTableview.separatorStyle = .none
        searchResultTableview.showsVerticalScrollIndicator = false
        
    }
    private func configuratedContraints(){
        resultCountTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        searchResultTableview.snp.makeConstraints { make in
            make.top.equalTo(resultCountTitle.snp.bottom).offset(8)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(8)
        }
    }
}
extension SearchResultViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.identifier, for: indexPath) as! SearchResultTableViewCell
        cell.configure(viewModel.list[indexPath.row])
        cell.noSelectionStyle()
        return cell
    }
}
