//
//  CustomNavigationButton.swift
//  OnboardingAezakmi
//
//  Created by Magzhan Zhumaly on 20.06.2024.
//

import SwiftUI
enum CustomButtonType: LocalizedStringResource {
    case `continue`
    case tryFreeAndSubscribe
    
    var string: LocalizedStringResource {
        switch self {
            
        case .continue:
            return "Continue"
        case .tryFreeAndSubscribe:
            return "Try free & subscribe"
        }
    }
}

struct CustomNavigationButton: View {
    var type: CustomButtonType
    var action: () -> Void
    let foregroundColor: Color
    let backgroundColor: Color
    
    var body: some View {
        Button(action: { action() }) {
            ZStack {
                Text(type.string)
            }
//            .font(.custom(.bold, size: 18))
            .padding(.vertical, 15)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
        }
        .buttonStyle(.plain)
        .clipShape(.buttonBorder)
    }
}

#Preview {
    CustomNavigationButton(type: .continue, action: {}, foregroundColor: .customButtonForegroundColor1, backgroundColor: .customButtonBackgroundColor1)
}
