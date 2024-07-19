//
//  HomeViewController.swift
//  final_project
//
//  Created by Nihad on 04.06.24.
//

import UIKit
import FloatingPanel

class HomeViewController: UIViewController, FloatingPanelControllerDelegate {
    private lazy var floatingPanelController: FloatingPanelController = {
        let panel = FloatingPanelController(delegate: self)
        let contentVC = HistoryTableViewController()
        panel.set(contentViewController: contentVC)
        panel.track(scrollView: contentVC.tableView)
        panel.isRemovalInteractionEnabled = true
        let appearance = SurfaceAppearance()
        appearance.cornerRadius = 20
        panel.surfaceView.appearance = appearance
        return panel
    }()
    
    private let controllerPageHeaderView: HomePageHeaderView = {
        let view = HomePageHeaderView()
        return view
    }()
    private let cardsCollectionView: CardsCollectionView = {
        let cv = CardsCollectionView()
        cv.backgroundColor = .clear
        //cv.isPagingEnabled = true
        cv.contentInset = .init(top: 8, left: 16, bottom: 8, right: 16)
        return cv
    }()
    private let buttonsView: UIView = {
        let bv = UIView()
        return bv
    }()
    private let buttonStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.horizontal(spacing: 4, alignment: .center, distribution: .fillEqually))
        return sv
    }()
    private lazy var topupButton: CustomButton = {
        let btn = CustomButton()
        btn.configure(.init(title: "Top up", type: .brand_light))
        btn.setImage(image: .plus, state: .normal)
        btn.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        return btn
    }()
    @objc
    private func didTap(){
        let vc = CardDetailsViewController()
        self.navigationController?.present(vc, animated: true)
    }
    private let transferButton: CustomButton = {
        let btn = CustomButton()
        btn.configure(.init(title: "Transfer", type: .brand_light))
        btn.setImage(image: .arrowNarrowRight, state: .normal)
        return btn
    }()
    private let depozitButton: CustomButton = {
        let btn = CustomButton()
        btn.configure(.init(title: "Depozit", type: .brand_light))
        btn.setImage(image: .wallet04, state: .normal)
        return btn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "Brand-primary-background")

        setup()
        configuratedConstraints()
        self.navigationController?.navigationBar.isHidden = true
    }
    private func setup(){
        view.addSubview(controllerPageHeaderView)
        view.addSubview(cardsCollectionView)
        view.addSubview(buttonsView)
        floatingPanelController.addPanel(toParent: self)
        floatingPanelController.layout = HomeMyFloatingPanelLayout()
        buttonsView.addSubview(buttonStackView)
        [
            topupButton,
            transferButton,
            depozitButton
        ].forEach(buttonStackView.addArrangedSubview)
        cardsCollectionView.dataSource = self
        cardsCollectionView.delegate = self
        
    }
    private func configuratedConstraints(){
        controllerPageHeaderView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(0)
        }
        cardsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(controllerPageHeaderView.snp.bottom).offset(0)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(0)
            make.height.equalTo(190)
        }
        buttonsView.snp.makeConstraints { make in
            make.top.equalTo(cardsCollectionView.snp.bottom).inset(0)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(0)
        }
        buttonStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
    }
}
extension HomeViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardsCollectionViewCell.identifier, for: indexPath) as! CardsCollectionViewCell
        return cell
    }
}
extension HomeViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = CardDetailsViewController()
        self.navigationController?.present(vc, animated: true)
    }
}

class HomeMyFloatingPanelLayout: FloatingPanelLayout {
    let position: FloatingPanelPosition = .bottom
    let initialState: FloatingPanelState = .half
    let anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] = [
        .full: FloatingPanelLayoutAnchor(absoluteInset: 16.0, edge: .top, referenceGuide: .safeArea),
        .half: FloatingPanelLayoutAnchor(fractionalInset: 0.5, edge: .bottom, referenceGuide: .safeArea),
        
    ]
}
