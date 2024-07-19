//
//  CustomSeperator.swift
//  final_project
//
//  Created by Nihad on 03.06.24.
//

import UIKit

class CustomSeparator: UIView {
    
    private let mainView: UIView = {
        let mv = UIView()
        return mv
    }()
    
    private let leftLine: UIView = {
        let line = UIView()
        line.applyLineBackground()
        return line
    }()
    
    private let rightLine: UIView = {
        let line = UIView()
        line.applyLineBackground()
        return line
    }()
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 16
        return view
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "or"
        label.applyInputTitleStyle()
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(mainView)
        mainView.addSubview(leftLine)
        mainView.addSubview(rightLine)
        mainView.addSubview(backgroundView)
        backgroundView.addSubview(label)
    }
    
    private func configureConstraints() {
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(24)
        }
        
        backgroundView.snp.makeConstraints { make in
            make.center.equalTo(mainView)
            make.height.equalTo(24)
        }
        
        label.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview().inset(4)
        }
        
        leftLine.snp.makeConstraints { make in
            make.centerY.equalTo(mainView)
            make.left.equalTo(mainView)
            make.right.equalTo(backgroundView.snp.left).inset(8)
            make.height.equalTo(2)
        }
        
        rightLine.snp.makeConstraints { make in
            make.centerY.equalTo(mainView)
            make.left.equalTo(backgroundView.snp.right).inset(8)
            make.right.equalTo(mainView)
            make.height.equalTo(2)
        }
    }
}
