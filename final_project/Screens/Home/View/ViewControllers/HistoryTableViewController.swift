//
//  HistoryTableViewController.swift
//  final_project
//
//  Created by Nihad on 06.06.24.
//

import UIKit

class HistoryTableViewController: UITableViewController{
    private let viewModel = HistoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: HistoryTableViewCell.identifier)
        tableView.separatorStyle = .none

    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.list.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.list[section].cell.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier, for: indexPath) as! HistoryTableViewCell
        cell.configure(viewModel.list[indexPath.section].cell[indexPath.row])
        cell.noSelectionStyle()
        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.list[section].header
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 
    }
}
