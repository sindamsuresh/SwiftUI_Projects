//
//  ContentView.swift
//  Onboarding In SwiftUI
//
//  Created by Suresh Sindam on 1/27/24.
//

import SwiftUI

struct AppView: View {
    
    @AppStorage("isOnboardingCompleted") var isOnboardingCompleted: Bool = false
    
    var body: some View {
        if isOnboardingCompleted {
            HomeView()
        } else {
            OnboardingView(isOnboardingCompleted: $isOnboardingCompleted, onBoardingData: OnBoardingData.onBoradingArr)
        }
    }
}



#Preview {
    AppView()
}
