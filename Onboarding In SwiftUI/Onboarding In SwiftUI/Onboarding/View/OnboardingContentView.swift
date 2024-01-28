//
//  OnboardingContentView.swift
//  Onboarding In SwiftUI
//
//  Created by Suresh Sindam on 1/27/24.
//

import SwiftUI

struct OnboardingContentView: View {
    var onboardingData: OnboardingModel
    
    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: onboardingData.image)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            Text(onboardingData.title)
                .font(.title)
                .fontWeight(.bold)
            
            Text(onboardingData.discription)
                .font(.subheadline)
                .fontWeight(.regular)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }.padding(.horizontal, 20)
    }
}

#Preview {
    OnboardingContentView(onboardingData: OnBoardingData.onBoradingArr.first!)
}
