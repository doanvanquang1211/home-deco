//
//  categorySlider.swift
//  swiftUI-demo
//
//  Created by Đoàn Văn Quang on 13/5/25.
//

import SwiftUI

struct CategorySlider : View {
    let categories: [Categories] = [
        Categories(name: "categoryIcon"),
        Categories(name: "categoryIcon1"),
        Categories(name: "categoryIcon3"),
        Categories(name: "categoryIcon4"),
        Categories(name: "categoryIcon3"),
        Categories(name: "categoryIcon1"),
    ]
    
    var body: some View {
        VStack(alignment:.leading){
            Text("Categories")
                .font(.poppinsBold(size: 15))
                .foregroundColor(Color(hex: 0xF4B5A4))
                .padding(.leading, 24)
                .padding(.top, 12)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(categories) { category in
                        ZStack(alignment:.center){
                            Color(hex: 0x4B4544)
                            Image(category.name)
                                .foregroundColor(Color(
                                    hex: 0xDCBEB6
                                ))
                        }
                        .frame(width: 65, height: 65)
                        .cornerRadius(13)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 6)
            }
        }
    }
}
