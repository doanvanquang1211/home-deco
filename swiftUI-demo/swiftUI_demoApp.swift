//
//  swiftUI_demoApp.swift
//  swiftUI-demo
//
//  Created by Đoàn Văn Quang on 6/5/25.
//

import SwiftUI

@main
struct swiftUI_demoApp: App {
    @State private var isScreen = "splash"
    
    var body: some Scene {
        WindowGroup {
            if isScreen == "onboard" {
                OnBoarding(isScreen: $isScreen)
            } else if isScreen == "splash" {
                LaunchA(isScreen: $isScreen)
            }else if isScreen == "view"{
                BottomTab()
            }else {
                AuthenContainer(isScreen: $isScreen)
            }
        }
    }
}
