//
//  ContentView.swift
//  OnboardingAezakmi
//
//  Created by Magzhan Zhumaly on 20.06.2024.
//

import SwiftUI
import StoreKit
import ApphudSDK

struct OnboardingView1: View {
    @EnvironmentObject var onboardingState: OnboardingState

    @State private var currentPage: Int = 0
    
    //    @ObservedObject var iapManager = IAPManager.shared
    @State private var selectedOption: String? = nil
    @State private var showPrivacyPolicy = false
    @State private var showTermsOfUse = false
    @State private var customButtonType = CustomButtonType.continue

    @State private var hasSeenRating = false
    let pageCount = 4
    
    let foregroundPrimaryColor = Color.foregroundPrimaryColor1
    let foregroundSecondaryColor = Color.foregroundSecondaryColor1
    let foregroundTerniaryColor = Color.foregroundTerniaryColor1
    
    let backgroundColor = Color.backgroundColor1
    
    let customButtonForegroundColor = Color.customButtonForegroundColor1
    let customButtonBackgroundColor = Color.customButtonBackgroundColor1
    
    let dotActiveColor = Color.dotActiveColor1
    let dotInactiveColor = Color.dotInactiveColor1
    
    
    let image1Name = "onboardingImage1.1"
    let image2Name = "onboardingImage2.1"
    let image3Name = "onboardingImage3.1"
    let image4Name = "onboardingImage4.1"
    let image5Name = "onboardingImage5.1"

    //    @State private var subscriptionButtonTitle = "Try free & subscribe"
    //    @State private var subtitle = "Try 3 days free then $4.99/week"
    
    //    let weeklySubscriptionPrice = ProductPrice(weeklyPrice: 4.99, periodPrice: 4.99)
    //    let monthlySubscriptionPrice = ProductPrice(weeklyPrice: 3.99, periodPrice: 15.99)
    //    let yearlySubscriptionPrice = ProductPrice(weeklyPrice: 0.79, periodPrice: 39.99)
    
    
    //    @State private var type
    var body: some View {
        VStack {
            tabView
//                .background(Color.red)
            navBar
                .frame(height: 140)
        }
        .background(backgroundColor)
    }
    
    var tabView: some View {
        TabView(selection: $currentPage) {
            
            WelcomeView(
                        foregroundPrimaryColor: foregroundPrimaryColor,
                        foregroundSecondaryColor: foregroundSecondaryColor,
                        foregroundTerniaryColor: foregroundTerniaryColor,
                        
                        primaryText: "Welcome to Telegroup!",
                        secondaryText: "Discover and join exciting groups and channels on Telegram!",
                        terniaryText: nil,
                        
                        imageName: image1Name)
            .environmentObject(onboardingState)

                .tag(0)
            
            WelcomeView(
                        foregroundPrimaryColor: foregroundPrimaryColor,
                        foregroundSecondaryColor: foregroundSecondaryColor,
                        foregroundTerniaryColor: foregroundTerniaryColor,
                        
                        primaryText: "We value your feedback!",
                        secondaryText: "Your feedback motivates us to work harder on the app",
                        terniaryText: nil,
                        
                        imageName: image2Name)
            .environmentObject(onboardingState)

                .tag(1)

            WelcomeView(
                        foregroundPrimaryColor: foregroundPrimaryColor,
                        foregroundSecondaryColor: foregroundSecondaryColor,
                        foregroundTerniaryColor: foregroundTerniaryColor,
                        
                        primaryText: "Find groups you need",
                        secondaryText: "Filter by category, language, followers number and more",
                        terniaryText: nil,
                        
                        imageName: image3Name)
            .environmentObject(onboardingState)

                .tag(2)

            WelcomeView(
                        foregroundPrimaryColor: foregroundPrimaryColor,
                        foregroundSecondaryColor: foregroundSecondaryColor,
                        foregroundTerniaryColor: foregroundTerniaryColor,
                        
                        primaryText: "Unlimited access!",
                        secondaryText: "Try 3 days free then $4.99/week!",
                        terniaryText: "Or proceed with limited version",
                        
                        imageName: image4Name)
            .environmentObject(onboardingState)

                .tag(3)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .onChange(of: currentPage) { newPage in
            changePage()
        }
    }
    
    var navBar: some View {
        
        VStack {
            Spacer()
            HStack {
                ForEach(0..<pageCount, id: \.self) { index in
                    DotView(index: index, currentPage: self.$currentPage, activeColor: dotActiveColor, inactiveColor: dotInactiveColor)
                }
            }
            
            CustomNavigationButton(type: customButtonType,
                                   action: { handleCustomButtonTap() },
                                   foregroundColor: customButtonForegroundColor,
                                   backgroundColor: customButtonBackgroundColor).padding()
            
            HStack {
                
                Button(action: {
                    showPrivacyPolicy = true
                }) {
                    Text("Privacy Policy")
                        .foregroundStyle(foregroundSecondaryColor)
                }

                Spacer()
                Divider()
                    .frame(height: 15)
                    .background(foregroundSecondaryColor)
                Spacer()
                
                Button(action: {
                    showTermsOfUse = true
                }) {
                    Text("Terms of Use")
                        .foregroundStyle(foregroundSecondaryColor)
                }
                
                Spacer()
                Divider()
                    .frame(height: 15)
                    .background(foregroundSecondaryColor)
                Spacer()
                
                Button(action: {
                    Task {
                        await Apphud.restorePurchases()
                    }
                    
                }) {
                    Text("Restore")
                        .foregroundStyle(foregroundSecondaryColor)
                }
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 15)
            .font(.footnote)
        }
        .sheet(isPresented: $showPrivacyPolicy) {
            WebView(url: URL(string: "https://www.termsfeed.com/live/e5fd68c8-2953-4738-a90b-b66f0f1f1c69")!)
        }
        .sheet(isPresented: $showTermsOfUse) {
            WebView(url: URL(string: "https://www.termsfeed.com/live/e5fd68c8-2953-4738-a90b-b66f0f1f1c69")!)
        }
    }
        
    private func handleCustomButtonTap() {
        if self.currentPage < pageCount - 1 {
            self.currentPage += 1
        } else {
            onboardingState.isOnboardingCompleted = true
        }
    }
    
    private func changePage() {
        
        if currentPage == 1 && !hasSeenRating {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.requestAppRating()
                hasSeenRating = true
            }
        }
        
        if currentPage == pageCount - 1 {
            customButtonType = .tryFreeAndSubscribe
        } else {
            customButtonType = .continue
        }
    }
    
    func requestAppRating() {
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            SKStoreReviewController.requestReview(in: scene)
        }
    }

    
    struct WelcomeView: View {
        @EnvironmentObject var viewModel: OnboardingViewModel
        @EnvironmentObject var onboardingState: OnboardingState

        @State private var limitedVersionChosen = false
        
        let foregroundPrimaryColor: Color
        let foregroundSecondaryColor: Color
        let foregroundTerniaryColor: Color
        
        let primaryText: String?
        let secondaryText: String?
        let terniaryText: String?

        let imageName: String
        
        var body: some View {
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                if let primaryText {
                    Text(primaryText)
                        .foregroundColor(foregroundPrimaryColor)
                        .multilineTextAlignment(.center)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.title)
                        .padding(.bottom, 5)
                        .padding(.horizontal, 15)
                }
                if let secondaryText {
                    Text(secondaryText)
                        .foregroundColor(foregroundSecondaryColor)
                        .multilineTextAlignment(.center)
                        .font(.callout)
                        .padding(.bottom, 5)
                        .padding(.horizontal, 50)
                }
                if let terniaryText {
                    Button(action: {
                        limitedVersionChosen = true
                        onboardingState.isOnboardingCompleted = true
                    }) {
                        Text(terniaryText)
                            .foregroundColor(foregroundTerniaryColor)
                            .multilineTextAlignment(.center)
                            .fontWeight(.light)
                            .font(.callout)
                            .padding(.bottom, 5)
                            .underline()
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .sheet(isPresented: $limitedVersionChosen) {
                WebView(url: URL(string: "https://www.termsfeed.com/live/e5fd68c8-2953-4738-a90b-b66f0f1f1c69")!)
            }
        }
    }
}


extension Color {
    static let foregroundPrimaryColor1 = Color.black
    static let foregroundSecondaryColor1 = Color(red: 146/255.0, green: 145/255.0, blue: 151/255.0)
    static let foregroundTerniaryColor1 = Color(red: 183/255.0, green: 182/255.0, blue: 188/255.0)

    static let backgroundColor1 = Color(red: 240/255.0, green: 239/255.0, blue: 243/255.0)
    
    static let customButtonForegroundColor1 = Color.white
    static let customButtonBackgroundColor1 = Color(red: 120/255.0, green: 178/255.0, blue: 236/255.0)
    
    static let dotActiveColor1 = customButtonBackgroundColor1
    static let dotInactiveColor1 = Color(red: 191/255.0, green: 190/255.0, blue: 196/255.0)
}

