//
//  commonTextField.swift
//  swiftUI-demo
//
//  Created by Đoàn Văn Quang on 11/5/25.
//

import SwiftUI

struct CommonTextField: View {
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    @State private var isSecured: Bool = true
    var color: Color? = nil

    var body: some View {
        HStack {
            if isSecure {
                if isSecured {
                    SecureField(placeholder, text: $text)
                        .font(.poppinsMedium(size: 14))
                        .frame(height: 41)
                        .padding(.horizontal, 12)
                        .foregroundColor(color ?? Color(hex: 0xDCBEB6))
                }else{
                    TextField(placeholder, text: $text)
                        .font(.poppinsMedium(size: 14))
                        .frame(height: 41)
                        .padding(.horizontal, 12)
                        .foregroundColor(Color(hex: 0xDCBEB6))
                }

            } else {
                TextField(placeholder, text: $text)
                    .font(.poppinsMedium(size: 14))
                    .frame(height: 41)
                    .padding(.horizontal, 12)
                    .foregroundColor(Color(hex: 0xDCBEB6))
            }
            if isSecure {
                Button(
                    action: {
                        isSecured.toggle()
                    }) {
                        Image(systemName: isSecured ?
                               "eye.slash" :
                                "eye"
                        )
                        .foregroundColor(.gray)
                    }
                    .padding(.trailing, 12)
            }
        }
        .font(.system(size: 16))
        .background(color ?? Color(hex: 0xFAF0E6))
        .cornerRadius(18)
    }
}

#Preview {
    @State var sampleText = "Hello"

    return CommonTextField(
        placeholder: "Enter text",
        text: .constant(sampleText),
        isSecure: false
    )
}
