//
//  categorySlider.swift
//  swiftUI-demo
//
//  Created by Đoàn Văn Quang on 13/5/25.
//

import SwiftUI

struct Categories: Identifiable {
    let id = UUID()
    let name: String
    let keys: String

}


struct CategorySlider : View {
    let categories: [Categories] = [
        Categories(name: "categoryIcon",keys: "1"),
        Categories(name: "categoryIcon1",keys: "2"),
        Categories(name: "categoryIcon3",keys: "3"),
        Categories(name: "categoryIcon4",keys: "4"),
        Categories(name: "categoryIcon3",keys: "5"),
        Categories(name: "categoryIcon1",keys: "6"),
    ]
    
    @State private var keys:String = "1"
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
                            Color(hex:category.keys == keys ? 0xF4B5A4 : 0x4B4544)
                            Image(category.name)
                                .foregroundColor(Color(
                                    hex: category.keys == keys ? 0xA7482F : 0xDCBEB6
                                ))
                        }
                        .frame(width: 65, height: 65)
                        .cornerRadius(13)
                        .onTapGesture {
                            self.keys = category.keys
                        }
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 6)
            }
        }
    }
}
