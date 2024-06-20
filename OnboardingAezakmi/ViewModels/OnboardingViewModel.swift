//
//  OnboardingViewModel.swift
//  OnboardingAezakmi
//
//  Created by Magzhan Zhumaly on 20.06.2024.
//

import SwiftUI

class OnboardingViewModel: ObservableObject {
    
    let foregroundPrimaryColor: Color
    let foregroundSecondaryColor: Color
    let foregroundTerniaryColor: Color
    let image1Name: String
    let image2Name: String
    let image3Name: String
    let image4Name: String
    let image5Name: String

    init(foregroundPrimaryColor: Color, foregroundSecondaryColor: Color, foregroundTerniaryColor: Color, image1Name: String, image2Name: String, image3Name: String, image4Name: String, image5Name: String) {
        self.foregroundPrimaryColor = foregroundPrimaryColor
        self.foregroundSecondaryColor = foregroundSecondaryColor
        self.foregroundTerniaryColor = foregroundTerniaryColor
        self.image1Name = image1Name
        self.image2Name = image2Name
        self.image3Name = image3Name
        self.image4Name = image4Name
        self.image5Name = image5Name
    }
    
}
