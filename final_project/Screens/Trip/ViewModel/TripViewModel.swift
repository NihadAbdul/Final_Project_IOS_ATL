//
//  TripViewModel.swift
//  final_project
//
//  Created by Nihad on 20.06.24.
//

import Foundation

class TripViewModel{
    init(){}
    
    var list: [TripModel.Item] = [
        .init(icon: "trip_plan", title: "Trip plan"),
        .init(icon: "buses", title: "Buses"),
        .init(icon: "bus_stops", title: "Nearby Stops"),
        .init(icon: "find_route", title: "Find Route")
    ]
}

class SearchResultViewModel{
    init(){}
    
    var list: [SearchResultModel.Item] = [
        .init(icon: "bus_icon", location: "20 Yanvar str", bus: "65. bus", time: "15 minute", nearby: "11m away"),
        .init(icon: "bus_icon", location: "20 Yanvar str", bus: "65. bus", time: "15 minute", nearby: "11m away"),
        .init(icon: "bus_icon", location: "20 Yanvar str", bus: "65. bus", time: "15 minute", nearby: "11m away"),
        .init(icon: "bus_icon", location: "20 Yanvar str", bus: "65. bus", time: "15 minute", nearby: "11m away"),
        .init(icon: "bus_icon", location: "20 Yanvar str", bus: "65. bus", time: "15 minute", nearby: "11m away"),
        .init(icon: "bus_icon", location: "20 Yanvar str", bus: "65. bus", time: "15 minute", nearby: "11m away"),
        .init(icon: "bus_icon", location: "20 Yanvar str", bus: "65. bus", time: "15 minute", nearby: "11m away"),
        .init(icon: "bus_icon", location: "20 Yanvar str", bus: "65. bus", time: "15 minute", nearby: "11m away")
    ]
}

