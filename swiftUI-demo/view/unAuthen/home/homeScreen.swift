//
//  homeScreen.swift
//  swiftUI-demo
//
//  Created by Đoàn Văn Quang on 11/5/25.
//

struct Categories: Identifiable {
    let id = UUID()
    let name: String
}

struct Collections: Identifiable {
    let id = UUID()
    let name: String
    let image:String
    let description:String
    let price:String
    let isFavourite: Bool
}

import SwiftUI

struct HomeScreen: View {
    
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
                    ScrollView{
                        VStack(alignment:.leading){
                            SlideView()
                            CategorySlider()
                            VStack(alignment:.leading){
                                Text("Best Seller")
                                    .font(.poppinsBold(size: 15))
                                    .foregroundColor(Color(hex: 0xF4B5A4))
                                    .padding(.top, 12)
                                Image("bestSellerImage")
                                    .foregroundColor(Color(
                                        hex: 0xDCBEB6
                                    ))
                            }
                            .padding(.horizontal, 24)
                            CollectionNew()
                            
                        }
                    }
                }
                Spacer()

            }
        }
    }
}

#Preview {
    HomeScreen()
}
