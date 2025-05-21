//
//  slider.swift
//  swiftUI-demo
//
//  Created by Đoàn Văn Quang on 13/5/25.
//

import SwiftUI

struct SlideView : View {
    let images = [
          "sliderImage",
          "sliderImage",
          "sliderImage"
      ]
    @State private var currentIndex = 0
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
  
    var body: some View {
        VStack {
            TabView(selection: $currentIndex) {
                ForEach(images.indices, id: \.self) { index in
                    Image(images[index])
                        .resizable()
                        .scaledToFill()
                        .tag(index)
                }
            }
            .tabViewStyle(
                PageTabViewStyle(indexDisplayMode: .never)
            )
            .frame(height: 132)
            .padding(.horizontal, 24)
            .padding(.top, 12)
            .clipped()
            .onReceive(timer) { _ in
                withAnimation {
                    currentIndex = (currentIndex + 1) % images.count
                }
            }
            HStack(spacing: 8) {
                ForEach(images.indices, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 10) // Rounded corners
                        .fill(
                            index == currentIndex
                            ? Color(hex: 0xFAF0E6) : Color(hex: 0xF4B5A4)
                        )
                        .frame(width: 18, height: 4)
                }
            }
            .padding(.top, 8)
        }
    }
}
