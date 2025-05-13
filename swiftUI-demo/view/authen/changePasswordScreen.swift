//
//  signinScreen.swift
//  swiftUI-demo
//
//  Created by Đoàn Văn Quang on 11/5/25.
//

import SwiftUI

struct ChangePasswordScreen: View {
    @Environment(\.dismiss) private var dismiss
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var navigateToRegister = false
    @State private var navigateToForgot = false

    var body: some View {
        
        NavigationStack{
            ZStack(alignment:.topLeading){
                Color(hex: 0x363130)
                    .ignoresSafeArea()
                VStack(alignment: .leading){
                    HStack{
                        Image("leftIcon").padding(.leading,24)
                            .onTapGesture {
                                dismiss()
                            }
                        Spacer()
                        Text("Set Password")
                            .foregroundColor(Color(hex: 0xF4B5A4))
                            .padding(.trailing, 44)
                        Spacer()
                    }
                    Text("change the password")
                        .font(.poppinsSemiBold(size: 22))
                        .foregroundColor(.white)
                        .padding(.leading, 24)
                        .padding(.top, 36)
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ")
                        .font(.poppinsRegular(size: 14))
                        .foregroundColor(.white)
                        .padding(.horizontal, 24)
                        .padding(.top, 2)
                    Text("Password")
                        .font(.poppinsMedium(size: 15))
                        .foregroundColor(.white)
                        .padding(.leading, 24)
                        .padding(.top, 52)
                    CommonTextField(
                        placeholder: "Password",
                        text: $password,
                        isSecure: true
                    )
                    .padding(.horizontal, 24)
                    Text("Confirm Password")
                        .font(.poppinsMedium(size: 15))
                        .foregroundColor(.white)
                        .padding(.leading, 24)
                        .padding(.top, 12)
                    CommonTextField(
                        placeholder: "ConfirmPassword",
                        text: $confirmPassword,
                        isSecure: true
                    )
                    .padding(.horizontal, 24)
                    Button(action: {
                        print("Button tapped!")
                    }) {
                        Text("Reset Password")
                            .font(.poppinsBold(size: 16))
                            .foregroundColor(Color(hex:0xCC7861))
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background(Color(hex: 0xF4B5A4))
                            .cornerRadius(23)
                    }
                    .padding(.top, 48)
                    .padding(.horizontal, 100)
//                    .navigationDestination(isPresented:$navigateToRegister){
//                        RegisterScreen().navigationBarBackButtonHidden(true)
//                    }
                }
                EnableSwipeBackGesture()
                    .frame(width: 0, height: 0)
            }
        }
    }
}

#Preview {
    ChangePasswordScreen()
}
