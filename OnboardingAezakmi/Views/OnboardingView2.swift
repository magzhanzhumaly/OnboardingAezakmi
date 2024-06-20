////
////  OnboardingView2.swift
////  OnboardingAezakmi
////
////  Created by Magzhan Zhumaly on 20.06.2024.
////
////
////  ContentView.swift
////  OnboardingAezakmi
////
////  Created by Magzhan Zhumaly on 20.06.2024.
////
//
//import SwiftUI
//import ApphudSDK
//
//struct OnboardingView2: View {
//    // rewrite the values for colors and images here manually, not by using variables
//    @StateObject var viewModel = OnboardingViewModel(foregroundPrimaryColor: .foregroundPrimaryColor2,
//                                                     foregroundSecondaryColor: .foregroundSecondaryColor2,
//                                                     foregroundTerniaryColor: .foregroundSecondaryColor2,
//                                                     image1Name: "onboardingImage5.2",
//                                                     image2Name: "onboardingImage2.2",
//                                                     image3Name: "onboardingImage3.2",
//                                                     image4Name: "onboardingImage4.2",
//                                                     image5Name: "onboardingImage5.2")
//
//    @State private var currentPage: Int = 0
//    
//    //    @ObservedObject var iapManager = IAPManager.shared
//    @State private var selectedOption: String? = nil
//    @State private var showPrivacyPolicy = false
//    @State private var showTermsOfUse = false
//    @State private var customButtonType = CustomButtonType.continue
//
//    let pageCount = 4
//    
//    let foregroundPrimaryColor = Color.foregroundPrimaryColor2
//    let foregroundSecondaryColor = Color.foregroundSecondaryColor2
//    let foregroundTerniaryColor = Color.foregroundTerniaryColor2
//
//    let backgroundColor = Color.backgroundColor2
//
//    let customButtonForegroundColor = Color.customButtonForegroundColor2
//    let customButtonBackgroundColor = Color.customButtonBackgroundColor2
//
//    let dotActiveColor = Color.dotActiveColor2
//    let dotInactiveColor = Color.dotInactiveColor2
//    
//    //    @State private var subscriptionButtonTitle = "Try free & subscribe"
//    //    @State private var subtitle = "Try 3 days free then $4.99/week"
//    
//    //    let weeklySubscriptionPrice = ProductPrice(weeklyPrice: 4.99, periodPrice: 4.99)
//    //    let monthlySubscriptionPrice = ProductPrice(weeklyPrice: 3.99, periodPrice: 15.99)
//    //    let yearlySubscriptionPrice = ProductPrice(weeklyPrice: 0.79, periodPrice: 39.99)
//    
//    
//    //    @State private var type
//    var body: some View {
//        VStack {
//            tabView
////                .background(Color.red)
//            navBar
//                .frame(height: 140)
//        }
//        .background(backgroundColor)
//    }
//    
//    var tabView: some View {
//        TabView(selection: $currentPage) {
//            
//            WelcomeView1()
//                .environmentObject(viewModel)
//                .tag(0)
//            FeedbackView1()
//                .environmentObject(viewModel)
//                .tag(1)
//            ExplanationView1()
//                .environmentObject(viewModel)
//                .tag(2)
//            PurchaseSubscriptionView1()
//                .environmentObject(viewModel)
//                .tag(3)
//        }
//        .tabViewStyle(.page(indexDisplayMode: .never))
//        .onChange(of: currentPage) { newPage in
//            changePage()
//        }
//    }
//    
//    var navBar: some View {
//        
//        VStack {
//            Spacer()
//            HStack {
//                ForEach(0..<pageCount, id: \.self) { index in
//                    DotView(index: index, currentPage: self.$currentPage, activeColor: dotActiveColor, inactiveColor: dotInactiveColor)
//                }
//            }
//            
//            CustomNavigationButton(type: customButtonType,
//                                   action: { handleCustomButtonTap() },
//                                   foregroundColor: customButtonForegroundColor,
//                                   backgroundColor: customButtonBackgroundColor).padding()
//            
//            HStack {
//                
//                Button(action: {
//                    showPrivacyPolicy = true
//                }) {
//                    Text("Privacy Policy")
//                        .foregroundStyle(foregroundSecondaryColor)
//                }
//
//                Spacer()
//                Divider()
//                    .frame(height: 15)
//                    .background(foregroundSecondaryColor)
//                Spacer()
//                
//                Button(action: {
//                    showTermsOfUse = true
//                }) {
//                    Text("Terms of Use")
//                        .foregroundStyle(foregroundSecondaryColor)
//                }
//                
//                Spacer()
//                Divider()
//                    .frame(height: 15)
//                    .background(foregroundSecondaryColor)
//                Spacer()
//                
//                Button(action: {
//                    Task {
//                        await Apphud.restorePurchases()
//                    }
//                    
//                }) {
//                    Text("Restore")
//                        .foregroundStyle(foregroundSecondaryColor)
//                }
//            }
//            .padding(.horizontal, 40)
//            .padding(.bottom, 15)
//            .font(.footnote)
//        }
//        .sheet(isPresented: $showPrivacyPolicy) {
//            WebView(url: URL(string: "https://www.termsfeed.com/live/e5fd68c8-2953-4738-a90b-b66f0f1f1c69")!)
//        }
//        .sheet(isPresented: $showTermsOfUse) {
//            WebView(url: URL(string: "https://www.termsfeed.com/live/e5fd68c8-2953-4738-a90b-b66f0f1f1c69")!)
//        }
//    }
//        
//    private func handleCustomButtonTap() {
//        if self.currentPage < pageCount - 1 {
//            self.currentPage += 1
//        }
//    }
//    
//    private func changePage() {
//        if currentPage == pageCount - 1 {
//            customButtonType = .tryFreeAndSubscribe
//        } else {
//            customButtonType = .continue
//        }
//    }
//}
//
//struct WelcomeView1: View {
//    @EnvironmentObject var viewModel: OnboardingViewModel
//
//    var body: some View {
//        VStack {
//            Spacer()
//            Image(viewModel.image1Name) // I want to use the viewModel.image1Name here!
//                .resizable()
//                .scaledToFit()
//                .frame(width: 200, height: 200)
//            Spacer()
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.gray.opacity(0.2))
//        
//    }
//}
//
//struct FeedbackView1: View {
//    var body: some View {
//        Text("Feedback View")
//    }
//}
//
//struct ExplanationView1: View {
//    var body: some View {
//        Text("Explanation View")
//    }
//}
//
//struct PurchaseSubscriptionView1: View {
//    var body: some View {
//        Text("Purchase Subscription View")
//    }
//}
//
//extension Color {
//    static let foregroundPrimaryColor2 = Color.black
//    static let foregroundSecondaryColor2 = Color(red: 146/255.0, green: 145/255.0, blue: 151/255.0)
//    static let foregroundTerniaryColor2 = Color(red: 183/255.0, green: 182/255.0, blue: 188/255.0)
//
//    static let backgroundColor2 = Color(red: 240/255.0, green: 239/255.0, blue: 243/255.0)
//    
//    static let customButtonForegroundColor2 = Color.white
//    static let customButtonBackgroundColor2 = Color(red: 120/255.0, green: 178/255.0, blue: 236/255.0)
//    
//    static let dotActiveColor2 = customButtonBackgroundColor1
//    static let dotInactiveColor2 = Color(red: 191/255.0, green: 190/255.0, blue: 196/255.0)
//}
//
//#Preview {
//    OnboardingView2()
//}
