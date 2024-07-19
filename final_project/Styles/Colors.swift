//
//  Colors.swift
//  final_project
//
//  Created by Nihad on 01.06.24.
//

import UIKit

struct ColorStyles{
    struct BaseColor{
        static let brand = UIColor(named: "Brand-Primary")
        static let brand_secondary = UIColor(named: "Brand-Secondary")
        static let brand_darker = UIColor(named: "Brand-Darker")
        static let brand_light = UIColor(named: "Brand-Light")
        static let brand_lighter = UIColor(named: "Brand-Lighter")
        static let white = UIColor(named: "White")
        static let black = UIColor(named: "Black")
        static let success_primary = UIColor(named: "success_primary")
        static let success_secondary = UIColor(named: "success_secondary")
    }
    struct Text{
        static let brand = BaseColor.brand
        static let gray_300 = UIColor(named: "Gray-300")
        static let gray_400 = UIColor(named: "Gray-400")
        static let gray_500 = UIColor(named: "Gray-500")
        static let brand_lighter = BaseColor.brand_lighter
        static let white = BaseColor.white
    }
    struct Button{
        static let gray_200 = UIColor(named: "Gray-200")
        static let brand = BaseColor.brand
        static let brand_seconday = BaseColor.brand_secondary
        static let brand_light = BaseColor.brand_light
    }
    struct Border{
        static let gray_100 = UIColor(named: "Gray-100")
    }
    struct Background{
        static let white = BaseColor.white
        static let inputBackground = UIColor(named: "input-background")
        static let buttonBackground = UIColor(named: "Gray-100")
        static let viewBackground = UIColor(named: "White")
        static let lineBackground = UIColor(named: "Gray-100")
        static let viewControllerBackground = BaseColor.brand
        static let cardBackground = BaseColor.brand_light
        static let cardLineBackground = BaseColor.brand_darker
    }
}
