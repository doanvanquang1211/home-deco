//
//  start.swift
//  swiftUI-demo
//
//  Created by Đoàn Văn Quang on 14/5/25.
//

import SwiftUI

struct StarRatingView: View {
    let rating: Double
    let maxRating: Int = 5

    private func starType(at index: Int) -> String {
        if rating >= Double(index + 1) {
            return "star.fill"
        } else if rating > Double(index) && rating < Double(index + 1) {
            return "star.leadinghalf.filled"
        } else {
            return "star"
        }
    }

    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<maxRating, id: \.self) { index in
                Image(systemName: starType(at: index))
                    .resizable()
                    .frame(width:16,height:16)
                    .foregroundColor(.yellow)
            }
            Text(String(format: "%.1f", rating))
                .foregroundColor(.white)
                .font(.subheadline)
        }
    }
}
