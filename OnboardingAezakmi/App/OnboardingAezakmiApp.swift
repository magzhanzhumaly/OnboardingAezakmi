//
//  OnboardingAezakmiApp.swift
//  OnboardingAezakmi
//
//  Created by Magzhan Zhumaly on 20.06.2024.
//

import SwiftUI
import ApphudSDK

@main
struct OnboardingAezakmiApp: App {
    @StateObject private var onboardingState = OnboardingState()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            if onboardingState.isOnboardingCompleted {
                MainView()
                    .edgesIgnoringSafeArea(.all)
                    .environmentObject(onboardingState)
            } else {
                OnboardingView1()
                    .environmentObject(onboardingState)
            }
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
//    @EnvironmentObject var onboardingState: OnboardingState

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        print("onboardingState.isOnboardingCompleted = \(onboardingState.isOnboardingCompleted)")

        Apphud.start(apiKey: "app_ndGknYk3TcfJ5cA3ig55R42RW1D6un")
        
        return true
    }
}

//#Preview("1") {
//    OnboardingView1()
//}
//
//#Preview("2") {
//    OnboardingView2()
//}
//
//#Preview("3") {
//    OnboardingView3()
//}
//
//#Preview("4") {
//    OnboardingView4()
//}
//
//#Preview("5") {
//    OnboardingView5()
//}
