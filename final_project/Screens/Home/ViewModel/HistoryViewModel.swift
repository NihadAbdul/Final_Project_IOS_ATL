//
//  HistoryViewModel.swift
//  final_project
//
//  Created by Nihad on 06.06.24.
//

import UIKit


class HistoryViewModel{
    init (){}
    
    var list: [HistoryModel.SectionModel] = [
        .init(header: "Today", cell: [
            .init(icon: "bus_icon", location: "20 Yanvar str", bus: "65. bus", price: "-0.40 Azn", time: "19:51pm"),
            .init(icon: "bus_icon", location: "20 Yanvar str", bus: "65. bus", price: "-0.40 Azn", time: "19:51pm"),
            .init(icon: "bus_icon", location: "20 Yanvar str", bus: "65. bus", price: "-0.40 Azn", time: "19:51pm"),
            .init(icon: "bus_icon", location: "20 Yanvar str", bus: "65. bus", price: "-0.40 Azn", time: "19:51pm"),
        ]),
        .init(header: "Yesterday", cell: [
            .init(icon: "bus_icon", location: "20 Yanvar str", bus: "65. bus", price: "-0.40 Azn", time: "19:51pm"),
            .init(icon: "bus_icon", location: "20 Yanvar str", bus: "65. bus", price: "-0.40 Azn", time: "19:51pm"),
            .init(icon: "bus_icon", location: "20 Yanvar str", bus: "65. bus", price: "-0.40 Azn", time: "19:51pm"),
            .init(icon: "bus_icon", location: "20 Yanvar str", bus: "65. bus", price: "-0.40 Azn", time: "19:51pm")
        ]),
        .init(header: "20 June 2024", cell: [
            .init(icon: "bus_icon", location: "20 Yanvar str", bus: "65. bus", price: "-0.40 Azn", time: "19:51pm"),
            .init(icon: "bus_icon", location: "20 Yanvar str", bus: "65. bus", price: "-0.40 Azn", time: "19:51pm"),
            .init(icon: "bus_icon", location: "20 Yanvar str", bus: "65. bus", price: "-0.40 Azn", time: "19:51pm"),
            .init(icon: "bus_icon", location: "20 Yanvar str", bus: "65. bus", price: "-0.40 Azn", time: "19:51pm"),
            .init(icon: "bus_icon", location: "20 Yanvar str", bus: "65. bus", price: "-0.40 Azn", time: "19:51pm")
        ])
    ]
}
