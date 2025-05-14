//
//  boardingPage.swift
//  swiftUI-demo
//
//  Created by Đoàn Văn Quang on 10/5/25.
//

import SwiftUI

struct OnBoarding: View {
    @State var imageA = "boardingA"
    @State var imageB = "boardingB"
    @State var imageC = "boardingC"
    @State var imageD = "boardingD"
    @Binding var isScreen: String

    @State var titleA = "Confortable Space"
    @State var descriptionA = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab){
            OnBoardingA(
                image:$imageA,
                title:$titleA,
                description:$descriptionA,
                selectedTab: $selectedTab,
                isScreen: $isScreen
            )
            .tag(0)
            OnBoardingA(
                image:$imageB,
                title:$titleA,
                description:$descriptionA,
                selectedTab: $selectedTab,
                isScreen: $isScreen
            )
            .tag(1)
            OnBoardingA(
                image:$imageC,
                title:$titleA,
                description:$descriptionA,
                selectedTab: $selectedTab,
                isScreen: $isScreen
            )
            .tag(2)
            OnBoardingA(
                image:$imageD,
                title:$titleA,
                description:$descriptionA,
                selectedTab: $selectedTab,
                isScreen: $isScreen
            )
            .tag(3)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .edgesIgnoringSafeArea(.all)
    }
}


struct OnBoardingA: View {
    @Binding var image: String
    @Binding var title: String
    @Binding var description: String
    @Binding var selectedTab: Int
    @Binding var isScreen: String

    @State private var navigateToNextScreen = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(
                    hex: 0x363130
                ).ignoresSafeArea()
                VStack{
                    ZStack(alignment:.topTrailing){
                        Image(image)
                            .resizable()
                            .resizable()
                            .scaledToFit()
                        Button(action: {
                            isScreen = "authen"
                            navigateToNextScreen = true
                        }) {
                            HStack{
                                Text("Skip")
                                    .font(.poppinsRegular(size: 14))
                                    .foregroundColor(Color(
                                        hex: 0x4B4544
                                    ))
                                Image("rightIcon")
                                    .foregroundColor(Color(
                                        hex: 0x4B4544
                                    ))
                                
                                
                            }
                        }
                        .padding(.top, 52)
                        .padding(.trailing, 26)
                        
                    }
                    Spacer()
                    Text(title)
                        .font(.system(size: 28))
                        .foregroundColor(.white)
                    Text(description)
                        .font(.poppinsSemiBold(size: 14))
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .multilineTextAlignment(.center).padding(.top, 8)
                    Spacer()
                    HStack{
                        Spacer()
                        Button(action: {
                            if(selectedTab < 3){
                                selectedTab += 1
                            }else{
                                isScreen = "authen"
                                navigateToNextScreen = true
                            }
                        }) {
                            Text("Next")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.vertical, 12)
                                .padding(.horizontal, 36)
                                .background(Color(hex: 0xF4B5A4))
                                .cornerRadius(23)
                            
                        }.padding(.trailing)
                    }
                    .navigationDestination(isPresented: $navigateToNextScreen) {
                        AuthenContainer(isScreen: $isScreen)
                            .navigationBarBackButtonHidden(true)
                    }
                    Spacer()
                }.ignoresSafeArea()
                
            }
        }
    }
}
#Preview {
    StatefulPreviewWrapper("") { isShowing in
        OnBoarding(isScreen: isShowing)
    }
}
