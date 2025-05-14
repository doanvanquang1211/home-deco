//
//  homeScreen.swift
//  swiftUI-demo
//
//  Created by Đoàn Văn Quang on 11/5/25.
//


struct Collections: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let description: String
    let content: String
    let price: String
    let isFavourite: Bool
}

import SwiftUI

struct HomeScreen: View {
    @State private var isShowTitle = true
    @State private var navigateToNextScreen = false
    @State private var title = "New Collection"
    @State private var dataDetail: Collections? = nil
    @Binding var selectedTab: Tab

    func gotoDetail(_ data:Collections){
        navigateToNextScreen = true
        dataDetail = data
    }

    var body: some View {
        
        NavigationStack{
            ZStack(alignment:.topLeading){
                Color(hex: 0x363130)
                    .ignoresSafeArea()
                VStack(alignment:.leading){
                    HStack{
                        VStack{
                            Text("Hi, Welcome Back")
                                .font(.poppinsBold(size: 20))
                                .foregroundColor(Color(hex: 0xF4B5A4))
                            Text("Create spaces that bring joy")
                                .font(.poppinsRegular(size: 14))
                                .foregroundColor(.white)
                                .padding(.leading, 12)
                        }
                        Spacer()
                        Image("searchIcon")
                            .padding(.trailing, 12)
                    }
                    .padding(.horizontal, 12)
                    ScrollView(showsIndicators: false){
                        VStack(alignment:.leading){
                            SlideView()
                            CategorySlider()
                            VStack(alignment:.leading){
                                Text("Best Seller")
                                    .font(.poppinsBold(size: 15))
                                    .foregroundColor(Color(hex: 0xF4B5A4))
                                    .padding(.top, 12)
                                Image("bestSellerImage")
                                    .resizable()
                                    .foregroundColor(Color(
                                        hex: 0xDCBEB6
                                    ))
                            }
                            .padding(.horizontal, 24)
                            CollectionNew(isShowTitle: $isShowTitle, title: $title)
                            .padding(.horizontal, 24)
                        }
                    }
                }
                Spacer()

            }
        }
    }
}

#Preview {
    @State var selectedTab: Tab = .home
    HomeScreen(selectedTab: $selectedTab)
}
