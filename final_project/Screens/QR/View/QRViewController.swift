//
//  QRViewController.swift
//  final_project
//
//  Created by Nihad on 08.06.24.
//

import UIKit

class QRViewController: UIViewController{
    
    private var countDownMinute = 4
    private var countDownSecond = 60
    private var timer = Timer()
    
    private lazy var generateQRButton: CustomButton = {
        let button = CustomButton()
        button.configure(.init(title: "Generate QR Code", type: .primary))
        button.addTarget(self, action: #selector(didTapCreateButton), for: .touchUpInside)
        return button
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Generate QR code to proceed"
        return label
    }()
    private let countDownStackView: UIStackView = {
        let sv = UIStackView()
        sv.apply(style: StackViewStyles.horizontal(spacing: 4))
        sv.isHidden = true
        return sv
    }()
    private let countDown: UILabel = {
        let label = UILabel()
        label.text = "This QR Code will be expired in"
        label.font = TextStyles.Subtitle.small
        label.textColor = ColorStyles.Text.gray_400
        return label
    }()
    private let countDownTime: UILabel = {
        let label = UILabel()
        label.font = TextStyles.Subtitle.small
        label.textColor = ColorStyles.Text.brand
        label.text = "05:00"
        return label
    }()
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "default_qr")
        return iv
    }()
    private let modalView: CustomModal = {
        let view = CustomModal()
        view.isHidden = true
        return view
    }()
    @objc
    private func didTapCreateButton(){
        let showModal = modalView.isHidden
        modalView.isHidden = !showModal
        tabBarController?.tabBar.isHidden = showModal
    }
  
    private func generateQRCode(from string:String) -> UIImage? {

        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator"){

            filter.setValue(data, forKey: "inputMessage")
            
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
            
        }
        
        return nil
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "QR Code"
        setup()
        configuratedConstraints()
    }
    
    private func setup(){
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        view.addSubview(generateQRButton)
        view.addSubview(modalView)
        view.addSubview(countDownStackView)
        
        [
            countDown,
            countDownTime
        ].forEach(countDownStackView.addArrangedSubview)
        
        modalView.delegate = self
    }
    private func configuratedConstraints(){
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(imageView.snp.top).offset(-32)
        }
        imageView.snp.makeConstraints { make in
            make.center.equalTo(view.safeAreaLayoutGuide)
            make.size.equalTo(280)
        }
        countDownStackView.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(imageView.snp.bottom).offset(32)
        }
        modalView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(0)
        }
        generateQRButton.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
    }
}
extension QRViewController: CustomModalViewDelegate{
    func didTapCancelButton() {
        modalView.isHidden = true
        tabBarController?.tabBar.isHidden = false
        countDownStackView.isHidden = true
    }
    func didTapPayButton() {
        modalView.isHidden = true
        tabBarController?.tabBar.isHidden = false
        countDownStackView.isHidden = false
        generateQRButton.isHidden = true
        titleLabel.text = "Scan this QR Code to process your payment"
        imageView.image = generateQRCode(from: "We should send the request to Backend for the QR Codes")
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countDownTimer), userInfo: nil, repeats: true)
    }
    @objc
    private func countDownTimer(){

        if countDownSecond == 0 {
            if countDownMinute > 0 {
                countDownMinute -= 1
                countDownSecond = 59
            }
        } else {
            countDownSecond -= 1
        }
  
        countDownTime.text = "0\(countDownMinute):\(countDownSecond)"
    }
}

