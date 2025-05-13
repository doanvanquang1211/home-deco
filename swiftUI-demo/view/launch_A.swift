//
//  launch.swift
//  swiftUI-demo
//
//  Created by Đoàn Văn Quang on 10/5/25.
//

import SwiftUI

struct LaunchA: View {
    @Binding var isScreen: String

    var body: some View {
        
        NavigationStack{
            ZStack{
                Color(hex: 0xF4B5A4)
                    .ignoresSafeArea()
                VStack{
                    Image("iconHome")
                    Image("txtLogo1").padding(.top, 8)
                    Image("txtLogo2")
                }
            }
            .task {
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                isScreen = "onboard"
            }
        }
    }
}

#Preview {
    StatefulPreviewWrapper("") { isScreen in
        LaunchA(isScreen: isScreen)
    }
}
