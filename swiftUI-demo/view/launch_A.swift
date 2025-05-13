//
//  launch.swift
//  swiftUI-demo
//
//  Created by Đoàn Văn Quang on 10/5/25.
//

import SwiftUI

struct LaunchA: View {
    var body: some View {
        
        ZStack{
            Color(hex: 0xF4B5A4)
                            .ignoresSafeArea()
            Image("iconHome")
        }
    }
}

struct LaunchA_Preview: PreviewProvider {
    
    static var previews: some View {
        LaunchA()
    }
}
