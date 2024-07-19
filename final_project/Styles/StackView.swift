//
//  StackView.swift
//  final_project
//
//  Created by Nihad on 02.06.24.
//

import UIKit

struct StackViewStyles {
    static func vertical(spacing: CGFloat = 8, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill) -> (UIStackView) -> Void {
        return { stackView in
            stackView.axis = .vertical
            stackView.spacing = spacing
            stackView.alignment = alignment
            stackView.distribution = distribution
        }
    }

    static func horizontal(spacing: CGFloat = 8, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill) -> (UIStackView) -> Void {
        return { stackView in
            stackView.axis = .horizontal
            stackView.spacing = spacing
            stackView.alignment = alignment
            stackView.distribution = distribution
        }
    }
}

extension UIStackView {
    func apply(style: (UIStackView) -> Void) {
        style(self)
    }
}
