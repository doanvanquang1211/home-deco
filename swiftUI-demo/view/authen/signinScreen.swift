//
//  signinScreen.swift
//  swiftUI-demo
//
//  Created by Đoàn Văn Quang on 11/5/25.
//

import SwiftUI

struct SigninScreen: View {
    @Environment(\.dismiss) private var dismiss
    @State private var username: String = ""
    @State private var password: String = ""
    @Binding var isScreen: String

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
                        Text("Login")
                            .foregroundColor(Color(hex: 0xF4B5A4))
                            .padding(.trailing, 44)
                        Spacer()
                    }
                    Text("Welcome")
                        .font(.poppinsSemiBold(size: 22))
                        .foregroundColor(.white)
                        .padding(.leading, 24)
                        .padding(.top, 36)
                    Text("Please enter your details to proceed.")
                        .font(.poppinsRegular(size: 14))
                        .foregroundColor(.white)
                        .padding(.leading, 24)
                        .padding(.top, 2)
                    Text("Username or email")
                        .font(.poppinsMedium(size: 15))
                        .foregroundColor(.white)
                        .padding(.leading, 24)
                        .padding(.top, 52)
                    CommonTextField(
                        placeholder: "Username",
                        text: $username
                    )
                    .padding(.horizontal, 24)
                    Text("Password")
                        .font(.poppinsMedium(size: 15))
                        .foregroundColor(.white)
                        .padding(.leading, 24)
                        .padding(.top, 12)
                    CommonTextField(
                        placeholder: "Password",
                        text: $password,
                        isSecure: true
                    )
                    .padding(.horizontal, 24)
                    Button(action: {
                        isScreen = "view"
                    }) {
                        Text("Log In")
                            .font(.poppinsBold(size: 16))
                            .foregroundColor(Color(hex:0xCC7861))
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background(Color(hex: 0xF4B5A4))
                            .cornerRadius(23)
                    }
                    .padding(.top, 48)
                    .padding(.horizontal, 100)
                    
                    NavigationLink(destination: ForgotPassWordScreen().navigationBarBackButtonHidden(true)) {
                        HStack{
                            Spacer()
                            Text("Forgot Password?")
                                .font(.poppinsSemiBold(size: 14))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding(.top, 12)
                            Spacer()
                        }
                    }
                    
                    Spacer()
                    HStack{
                        Spacer()
                        Text("or sign up with")
                            .font(.poppinsSemiBold(size: 13))
                            .foregroundColor(.white)
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        Image("fbIcon")
                            .padding(.horizontal, 4)
                        Image("ggIcon")
                            .padding(.horizontal, 4)
                        Spacer()
                    }
                    .padding(.top, 12)
                  
                    NavigationLink(destination: RegisterScreen(isScreen:$isScreen).navigationBarBackButtonHidden(true)) {
                        HStack{
                            Spacer()
                            Text("Don’t have an account?")
                                .font(.poppinsRegular(size: 13))
                                .foregroundColor(.white)
                            Text("Sign Up")
                                .font(.poppinsRegular(size: 13))
                                .foregroundColor(Color(hex: 0xF4B5A4))
                            Spacer()
                        }
                        .padding(.top, 12)
                        .padding(.bottom, 22)
                    }
                }
                EnableSwipeBackGesture()
                    .frame(width: 0, height: 0)
            }
        }
    }
}

#Preview {
    StatefulPreviewWrapper("") { isScreen in
        SigninScreen(isScreen: isScreen)
    }
}
