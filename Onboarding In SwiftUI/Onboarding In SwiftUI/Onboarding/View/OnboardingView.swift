//
//  OnboardingView.swift
//  Onboarding In SwiftUI
//
//  Created by Suresh Sindam on 1/27/24.
//

import SwiftUI

struct OnboardingView: View {
    
    @State var currentPage = 0
    @Binding var isOnboardingCompleted: Bool
    
    var onBoardingData: [OnboardingModel]
    
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(onBoardingData.indices, id: \.self) { index in
                    OnboardingContentView(onboardingData: onBoardingData[index])
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
            if (currentPage == onBoardingData.count - 1) {
                Button(action: {
                    isOnboardingCompleted.toggle()
                }, label: {
                    Text("Get Started")
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                        .padding(.horizontal, 20)
                })
            }
        }
    }
}



#Preview {
    OnboardingView(isOnboardingCompleted: .constant(false), onBoardingData: OnBoardingData.onBoradingArr)
}
