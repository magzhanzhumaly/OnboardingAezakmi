//
//  DotView.swift
//  OnboardingAezakmi
//
//  Created by Magzhan Zhumaly on 20.06.2024.
//

import SwiftUI

struct DotView: View {
    let index: Int
    @Binding var currentPage: Int
    let activeColor: Color
    let inactiveColor: Color
    
    var body: some View {
        Circle().fill(checkCurrentPage())
            .frame(width: 8, height: 8)
    }
    
    func checkCurrentPage() -> Color {
        if index <= currentPage {
            return activeColor
        }
        
        return inactiveColor
    }
}

#Preview {
    Group {
        DotView(index: 0, currentPage: .constant(0), activeColor: .foregroundPrimaryColor1, inactiveColor: .foregroundPrimaryColor1.opacity(0.2))
        DotView(index: 1, currentPage: .constant(0), activeColor: .foregroundPrimaryColor1, inactiveColor: .foregroundPrimaryColor1.opacity(0.2))
     }
}
