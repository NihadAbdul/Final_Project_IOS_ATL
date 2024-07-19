//
//  TripSearchViewController.swift
//  final_project
//
//  Created by Nihad on 21.06.24.
//

import UIKit
import GooglePlaces

class TripSearchViewController: UIViewController {
    
    private var searchResults: [ResultModel.Item] = []
    private let placesClient = GMSPlacesClient.shared()
    
    private let searchFieldStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.vertical(spacing: 2, alignment: .fill, distribution: .fillEqually))
        return sv
    }()
    
    private lazy var locationSearchTextField: CustomInputTextField = {
        let tf = CustomInputTextField()
        tf.configure(.init(title: nil, placeholder: "Your location", image: .leading, leadingImageName: "marker-pin-02", trailingImageName: nil))
        tf.inputTextField.delegate = self
        return tf
    }()
    
    private lazy var destinationSearchTextField: CustomInputTextField = {
        let tf = CustomInputTextField()
        tf.configure(.init(title: nil, placeholder: "Your destination", image: .leading, leadingImageName: "marker-pin-02", trailingImageName: nil))
        tf.inputTextField.delegate = self
        return tf
    }()
    
    private let emptyScreenImageTitleStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.vertical(spacing: 8, alignment: .center, distribution: .equalCentering))
        return sv
    }()
    
    private let resultTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SearchPredictionsTableViewCell.self, forCellReuseIdentifier: SearchPredictionsTableViewCell.identifier)
        return tableView
    }()
    
    private let emptyScreenImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "no_search_history")
        return img
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "You don’t have search history"
        label.font = TextStyles.Title.medium
        label.textColor = ColorStyles.Text.gray_500
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.isHidden = false
        popViewController()
        
        title = "Search"
        
        setup()
        configureConstraints()
        resultTableView.dataSource = self
        resultTableView.delegate = self
        resultTableView.isHidden = true
    }
    
    
    private func fetchAutocompletePredictions(for query: String) {
        let filter = GMSAutocompleteFilter()
        filter.types = .none
        
        placesClient.findAutocompletePredictions(fromQuery: query, filter: filter, sessionToken: nil) { (results, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            self.searchResults = results?.map { prediction in
                ResultModel.Item(
                    title: prediction.attributedPrimaryText.string)
            } ?? []
            self.resultTableView.reloadData()
        }
    }
    
    private func setup() {
        view.addSubview(searchFieldStackView)
        view.addSubview(emptyScreenImageTitleStackView)
        view.addSubview(resultTableView)
        [
            locationSearchTextField,
            destinationSearchTextField
        ].forEach(searchFieldStackView.addArrangedSubview)
        
        [
            emptyScreenImageView,
            titleLabel
        ].forEach(emptyScreenImageTitleStackView.addArrangedSubview)
        
        resultTableView.showsVerticalScrollIndicator = false
        resultTableView.separatorStyle = .none
    }
    
    private func configureConstraints() {
        searchFieldStackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
        }
        emptyScreenImageTitleStackView.snp.makeConstraints { make in
            make.center.equalTo(view.safeAreaLayoutGuide)
        }
        emptyScreenImageView.snp.makeConstraints { make in
            make.height.equalTo(150)
            make.width.equalTo(180)
        }
        resultTableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.top.equalTo(searchFieldStackView.snp.bottom).offset(8)
        }
    }
    
    private func updateUIForSearch() {
        emptyScreenImageTitleStackView.isHidden = true
        resultTableView.isHidden = false
    }
    
    private func resetUI() {
        emptyScreenImageTitleStackView.isHidden = false
        resultTableView.isHidden = true
    }
}

extension TripSearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchPredictionsTableViewCell.identifier, for: indexPath) as! SearchPredictionsTableViewCell
        let model = searchResults[indexPath.row]
        cell.configure(model)
        cell.noSelectionStyle()
        return cell
    }
}

extension TripSearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let placeID = "EhtOaXphbWkgU3QsIEJha3UsIEF6ZXJiYWlqYW4iLiosChQKEgmNbywCr30wQBFWQKyv2TVlThIUChIJ-Rwh1mt9MEARa2zlel5rPzQ"
        
        let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt64(UInt(GMSPlaceField.name.rawValue) |
                                                                   UInt(GMSPlaceField.placeID.rawValue)))

        placesClient.fetchPlace(fromPlaceID: placeID, placeFields: fields, sessionToken: nil, callback: { (place: GMSPlace?, error: Error?) in
          if let error = error {
            print("An error occurred: \(error.localizedDescription)")
            return
          }
          if let place = place {
              if self.locationSearchTextField.inputTextField.isEditing == true{
                  self.locationSearchTextField.inputTextField.text = place.name
                  self.resetUI()
              }
              if self.destinationSearchTextField.inputTextField.isEditing == true{
                  self.destinationSearchTextField.inputTextField.text = place.name
                  let vc = SearchResultViewController()
                  self.navigationController?.pushViewController(vc, animated: true)
              }
              print("The selected place is: \(String(describing: place.name))")
          }
        })
    }
}

extension TripSearchViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? string
        if newText.isEmpty {
            self.resetUI()
        } else {
            self.updateUIForSearch()
            fetchAutocompletePredictions(for: newText)
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        updateUIForSearch()
    }
}
