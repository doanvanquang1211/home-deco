//
//  authenContainer.swift
//  swiftUI-demo
//
//  Created by Đoàn Văn Quang on 11/5/25.
//

import SwiftUI

struct AuthenContainer: View {
    @Binding var isScreen: String
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                Color(
                    hex: 0x363130
                ).ignoresSafeArea()
                VStack{
                    Image("iconHome",)
                        .renderingMode(.template)
                        .foregroundColor(Color(
                            hex: 0xF4B5A4
                        ))
                    Image("txtLogo1")
                        .renderingMode(.template)
                        .foregroundColor(Color(
                            hex: 0xF4B5A4
                        ))
                        .padding(.top, 8)
                    Image("txtLogo2")
                        .renderingMode(.template)
                        .foregroundColor(Color(
                            hex: 0xF4B5A4
                        ))
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod. ")
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 22)
                        .padding(.horizontal, 24)
                    
                    NavigationLink(destination: SigninScreen(isScreen:$isScreen).navigationBarBackButtonHidden(true)) {
                            Text("Login")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 12)
                                .background(Color(hex: 0xF4B5A4))
                                .cornerRadius(23)
                                .frame(width: 200)
                                .padding(.top, 18)
                    }
                    NavigationLink(destination: RegisterScreen(isScreen:$isScreen).navigationBarBackButtonHidden(true)) {
                            Text("Sign Up")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 12)
                                .background(Color(hex: 0x4B4544))
                                .cornerRadius(23)
                                .padding(.top, 4)
                                .frame(width: 200)
                    }
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    StatefulPreviewWrapper("") { isScreen in
        AuthenContainer(isScreen: isScreen)
    }
}
