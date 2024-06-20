//
//  MainView.swift
//  OnboardingAezakmi
//
//  Created by Magzhan Zhumaly on 20.06.2024.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var onboardingState: OnboardingState

    var body: some View {
        Text("Main View")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .edgesIgnoringSafeArea(.all)
        
        Button(action: {
            onboardingState.resetOnboarding()
        }) {
            Text("Reset Onboarding")
        }
        .padding(.bottom, 20)
        
        
        Button(action: {
            
        }) {
            Text("buy subscription")
        }
    }
}


#Preview {
    MainView()
}
