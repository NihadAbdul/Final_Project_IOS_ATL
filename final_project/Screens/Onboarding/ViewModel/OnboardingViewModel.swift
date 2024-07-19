//
//  OnboardingViewModel.swift
//  final_project
//
//  Created by Nihad on 02.06.24.
//

import UIKit

class OnboardingViewModel {
    init() {}
    var list: [OnboardingModel.Item] = [
        .init(title: "Balance Management", subtitle: "Top Up Anytime, Anywhere", description: "Quickly add balance to your transport card. Our secure system ensures you’re always ready for your next trip, with no more long lines or hassle.", img: "onboarding_1"),
        .init(title: "Real-time Updates", subtitle: "Navigate with Confidence", description: "Discover the most efficient routes to your destination. Get real-time updates on bus locations and schedules for a smooth journey.", img: "onboarding_2"),
        .init(title: "Manage Multiple Card", subtitle: "All Your Cards in One Place", description: "Easily create and manage multiple transport cards. Keep everything organized and accessible, and switch between cards with ease.", img: "onboarding_3")
    ]
    
}
