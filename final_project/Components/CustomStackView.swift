//
//  CustomStackView.swift
//  final_project
//
//  Created by Nihad on 02.06.24.
//

import UIKit

class VerticalStackView: UIStackView {
    init(spacing: CGFloat = 8, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill) {
        super.init(frame: .zero)
        self.axis = .vertical
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class HorizontalStackView: UIStackView {
    init(spacing: CGFloat = 8, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill) {
        super.init(frame: .zero)
        self.axis = .horizontal
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
