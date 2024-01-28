//
//  OnboardingModel.swift
//  Onboarding In SwiftUI
//
//  Created by Suresh Sindam on 1/27/24.
//

import Foundation

struct OnboardingModel {
    let image: String
    let title: String
    let discription: String
}


struct OnBoardingData {
    static let onBoradingArr = [
        OnboardingModel(image: "figure.strengthtraining.traditional", title: "Welcome to Fitness App", discription: "Achieve your fitness goals with our personalized workouts and plans."),
        OnboardingModel(image: "figure.stair.stepper", title: "Track Your Progress", discription: "Monitor your daily activities, track your progress, and stay motivated on your fitness journey."),
        OnboardingModel(image: "tree.circle.fill", title: "Nutrition Guidance", discription: "Get personalized nutrition plans to complement your workouts and help you reach your fitness goals faster."),
        OnboardingModel(image: "person.3.fill", title: "Connect with Community", discription: "Join our active community of fitness enthusiasts. Share your achievements, get tips, and stay inspired together.")
    ]
}
