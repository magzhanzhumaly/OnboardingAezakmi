//
//  OnboardingState.swift
//  OnboardingAezakmi
//
//  Created by Magzhan Zhumaly on 20.06.2024.
//

import SwiftUI

class OnboardingState: ObservableObject {
    @AppStorage("isOnboardingCompleted") var isOnboardingCompleted: Bool = false
    
    func resetOnboarding() {
        isOnboardingCompleted = false
    }
}
