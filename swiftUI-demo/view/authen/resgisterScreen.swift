//
//  signinScreen.swift
//  swiftUI-demo
//
//  Created by Đoàn Văn Quang on 11/5/25.
//

import SwiftUI

struct RegisterScreen: View {
    @Environment(\.dismiss) private var dismiss
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
    @State private var birth: String = ""
    @State private var password: String = ""
    @State private var confỉmPassword: String = ""
    @State private var navigateToSignin = false
    @Binding var isScreen: String

    var body: some View {
        
        NavigationStack{
            ZStack(alignment:.topLeading){
                Color(hex: 0x363130)
                    .ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading){
                        HStack{
                            Image("leftIcon").padding(.leading,24)
                                .onTapGesture {
                                    dismiss()
                                }
                            Spacer()
                            Text("Create Account")
                                .foregroundColor(Color(hex: 0xF4B5A4))
                                .padding(.trailing, 44)
                            Spacer()
                        }
                        Text("Full name")
                            .font(.poppinsMedium(size: 15))
                            .foregroundColor(.white)
                            .padding(.leading, 24)
                            .padding(.top, 32)
                        CommonTextField(
                            placeholder: "fullName",
                            text: $fullName
                        )
                        .padding(.horizontal, 24)
                        
                        Text("Email")
                            .font(.poppinsMedium(size: 15))
                            .foregroundColor(.white)
                            .padding(.leading, 24)
                            .padding(.top, 12)
                        CommonTextField(
                            placeholder: "Email",
                            text: $email
                        )
                        .padding(.horizontal, 24)
                        
                        Text("Mobile Number")
                            .font(.poppinsMedium(size: 15))
                            .foregroundColor(.white)
                            .padding(.leading, 24)
                            .padding(.top, 12)
                        CommonTextField(
                            placeholder: "+ 123 456 789",
                            text: $phone
                        )
                        .padding(.horizontal, 24)
                        
                        Text("Date Of Birth")
                            .font(.poppinsMedium(size: 15))
                            .foregroundColor(.white)
                            .padding(.leading, 24)
                            .padding(.top, 12)
                        CommonTextField(
                            placeholder: "DD/MM/YYYY",
                            text: $birth
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
                        
                        Text("Confirm Password")
                            .font(.poppinsMedium(size: 15))
                            .foregroundColor(.white)
                            .padding(.leading, 24)
                            .padding(.top, 12)
                        CommonTextField(
                            placeholder: "Confirm Password",
                            text: $confỉmPassword,
                            isSecure: true
                        )
                        .padding(.horizontal, 24)
                        
                        HStack{
                            Spacer()
                            Text("By continuing, you agree to ")
                                .font(.poppinsSemiBold(size: 13))
                                .foregroundColor(.white)
                                .padding(.top, 12)
                            Spacer()
                        }
                        
                        HStack{
                            Spacer()
                            Text("Terms of Use and Privacy Policy.")
                                .font(.poppinsSemiBold(size: 13))
                                .foregroundColor(Color(hex: 0xF4B5A4))
                                .padding(.top, 0)
                            Spacer()
                        }
                        
                        Button(action: {
                            print("Button tapped!")
                        }) {
                            Text("Sign Up")
                                .font(.poppinsBold(size: 16))
                                .foregroundColor(Color(hex:0xCC7861))
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 12)
                                .background(Color(hex: 0xF4B5A4))
                                .cornerRadius(23)
                        }
                        .padding(.top, 12)
                        .padding(.horizontal, 100)
                        
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
                        .padding(.top, 4)
                      
                        NavigationLink(destination: SigninScreen(isScreen:$isScreen).navigationBarBackButtonHidden(true)) {
                                HStack{
                                    Spacer()
                                    Text("Already have an account?")
                                        .font(.poppinsRegular(size: 13))
                                        .foregroundColor(.white)
                                    Text("Log in")
                                        .font(.poppinsRegular(size: 13))
                                        .foregroundColor(Color(hex: 0xF4B5A4))
                                    Spacer()
                                }
                                .padding(.top, 12)
                                .padding(.bottom, 22)
                        }
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
        RegisterScreen(isScreen: isScreen)
    }
}
