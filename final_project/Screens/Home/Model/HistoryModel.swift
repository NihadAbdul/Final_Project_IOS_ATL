//
//  HistoryModel.swift
//  final_project
//
//  Created by Nihad on 06.06.24.
//

import UIKit

struct HistoryModel{
    struct SectionModel{
        let header: String
        let cell: [Item]
    }
    struct Item {
        let icon: String
        let location: String
        let bus: String
        let price: String
        let time: String
    }
}
