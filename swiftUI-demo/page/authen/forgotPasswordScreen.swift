//
//  signinScreen.swift
//  swiftUI-demo
//
//  Created by Đoàn Văn Quang on 11/5/25.
//

import SwiftUI

struct ForgotPassWordScreen: View {
    @Environment(\.dismiss) private var dismiss
    @State private var email: String = ""
    @State private var navigateToChangePassword = false

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
                        Text("Forgot Password")
                            .foregroundColor(Color(hex: 0xF4B5A4))
                            .padding(.trailing, 44)
                        Spacer()
                    }
                    Text("Reset Password")
                        .font(.poppinsSemiBold(size: 22))
                        .foregroundColor(.white)
                        .padding(.leading, 24)
                        .padding(.top, 36)
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ")
                        .font(.poppinsRegular(size: 14))
                        .foregroundColor(.white)
                        .padding(.horizontal, 24)
                        .padding(.top, 2)
                    
                    ZStack(alignment:.topLeading){
                        Color(hex: 0xFAF0E6)
                            .cornerRadius(31)
                            .ignoresSafeArea()
                        VStack(alignment:.leading){
                            Text("Enter your email address")
                                .font(.poppinsMedium(size: 15))
                                .foregroundColor(Color(hex: 0x363130))
                                .padding(.leading, 24)
                                .padding(.top, 12)
                            CommonTextField(
                                placeholder: "example@example.com",
                                text: $email,
                                color: .white
                            )
                            .padding(.horizontal, 24)
                            
                            NavigationLink(destination: ChangePasswordScreen().navigationBarBackButtonHidden(true)) {
                                    Text("Send")
                                        .font(.poppinsBold(size: 16))
                                        .foregroundColor(Color(hex:0xCC7861))
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 12)
                                        .background(Color(hex: 0xF4B5A4))
                                        .cornerRadius(23)
                                        .padding(.top, 32)
                                        .padding(.horizontal, 120)
                            }
                        }
                        .padding(.top, 32)
                    }
                    .padding(.top, 32)
                }
                EnableSwipeBackGesture()
                    .frame(width: 0, height: 0)
            }
        }
    }
}

#Preview {
    ForgotPassWordScreen()
}
