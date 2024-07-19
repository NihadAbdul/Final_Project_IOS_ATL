//
//  TripViewController.swift
//  final_project
//
//  Created by Nihad on 08.06.24.
//

import UIKit
import GoogleMaps
import CoreLocation

class TripViewController: UIViewController {
    
    private let viewModel = TripViewModel()
    private let manager = CLLocationManager()
    
    private lazy var tripSearchTextField: CustomInputTextField = {
        let tf = CustomInputTextField()
        tf.configure(.init(title: nil, placeholder: "Search the place to go...", image: .leading, leadingImageName: "search-md", trailingImageName: nil))
        tf.addTarget(self, action: #selector(didTapSearch), for: .editingDidBegin)
        return tf
    }()
    
    private let tripActionCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let screenWidth = UIScreen.main.bounds.width - 56
        layout.itemSize = .init(width: screenWidth / 3, height: 82)
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        cv.register(TripActionCollectionViewCell.self, forCellWithReuseIdentifier: TripActionCollectionViewCell.identifier)
        cv.backgroundColor = .clear
        cv.isScrollEnabled = true
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    private var mapView: GMSMapView!
    
    @objc
    private func didTapSearch() {
        let vc = TripSearchViewController()
        tripSearchTextField.inputTextField.clearsOnBeginEditing = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.backgroundColor = .systemBackground
        title = "Trip"
        
        setup()
        configuratedConstraints()
        addShadow(to: tripSearchTextField)
    }
    
    private func setup() {
        view.addSubview(tripSearchTextField)
        view.addSubview(tripActionCollectionView)
        
        tripActionCollectionView.dataSource = self
        tripActionCollectionView.delegate = self
        
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    private func configuratedConstraints() {
        tripSearchTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        
        tripActionCollectionView.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(0)
            make.height.equalTo(98)
        }
        
        mapView?.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.leading.trailing.equalTo(view)
            make.bottom.equalTo(view)
        }
    }
}

extension TripViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TripActionCollectionViewCell.identifier, for: indexPath) as! TripActionCollectionViewCell
        cell.configure(viewModel.list[indexPath.row])
        return cell
    }
}

extension TripViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
}

extension TripViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        
        let coordinate = location.coordinate
        let camera = GMSCameraPosition.camera(withLatitude: coordinate.latitude, longitude: coordinate.longitude, zoom: 20)
        
        if mapView == nil {
            mapView = GMSMapView.map(withFrame: .zero, camera: camera)
            self.view.insertSubview(mapView, at: 0)
            configuratedConstraints()
        } else {
            mapView.camera = camera
        }
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        marker.title = "Baku"
        marker.snippet = "Azerbaijan"
        marker.map = mapView
    }
}

