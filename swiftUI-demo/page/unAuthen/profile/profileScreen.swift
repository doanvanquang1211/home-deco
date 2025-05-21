//
//  profileScreen.swift
//  swiftUI-demo
//
//  Created by Đoàn Văn Quang on 21/5/25.
//

import SwiftUI

struct ProfileScreen: View {
    @Binding var selectedTab: Tab
    @EnvironmentObject var cartVM: CartViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var isData: Bool = false

    var body: some View {
        return NavigationStack{
            ZStack(alignment:.topLeading){
                Color(hex: 0x363130)
                    .ignoresSafeArea()
                ScrollView{
                    VStack(alignment:.leading){
                        HStack{
                            Image("leftIcon")
                                .onTapGesture {
                                    selectedTab = .home
                                    presentationMode.wrappedValue.dismiss()
                                }
                            Spacer()
                            Text("My Profile")
                                .font(.poppinsBold(size: 20))
                                .foregroundColor(Color(hex: 0xF4B5A4))
                            Spacer()
                            Image("editIcon")
                                .resizable()
                                .frame(width: 22, height: 22)
                        }
                        .padding(.horizontal, 24)
                        .padding(.bottom, 24)
                        
                        HStack{
                            Spacer()
                            VStack(alignment:.center){
                                Image("avatarImage")
                                Text("Doan Van Quang")
                                    .font(.poppinsBold(size: 20))
                                    .foregroundColor(.white)
                                    .padding(.top, 4)
                                HStack{
                                    Text("ID:")
                                        .font(.poppinsBold(size: 13))
                                        .foregroundColor(.white)
                                    Text("25030024")
                                        .font(.poppinsBold(size: 13))
                                        .foregroundColor(.white)
                                }
                                .padding(.top, 0)
                            }
                            Spacer()
                        }
                        
                        
                        
                        ZStack{
                            Color(hex: 0xF4B5A4)
                                .ignoresSafeArea()
                            HStack{
                                VStack{
                                    Image("profileBigIcon")
                                        .resizable()
                                        .frame(width: 22, height: 22)
                                    Text("Profile")
                                        .font(.poppinsBold(size: 13))
                                        .foregroundColor(Color(hex: 0x4B4544))
                                }
                                Spacer()
                                Rectangle()
                                    .fill(.white)
                                    .frame(width: 1, height: 40)
                                Spacer()
                                VStack{
                                    Image("wishListBigIcon")
                                        .resizable()
                                        .frame(width: 22, height: 22)
                                    Text("Wishlist")
                                        .font(.poppinsBold(size: 13))
                                        .foregroundColor(Color(hex: 0x4B4544))
                                }
                                Spacer()
                                Rectangle()
                                    .fill(.white)
                                    .frame(width: 1, height: 40)
                                Spacer()
                                VStack{
                                    Image("orderIcon")
                                        .resizable()
                                        .frame(width: 22, height: 22)
                                    Text("My Orders")
                                        .font(.poppinsBold(size: 13))
                                        .foregroundColor(Color(hex: 0x4B4544))
                                }
                            }
                            .padding(.horizontal, 22)
                        }
                        .frame(height: 65)
                        .cornerRadius(8)
                        .padding(.horizontal, 32)
                        .padding(.top, 22)
                        
                        VStack(alignment:.leading){
                            profileItem(image: "lockIcon", text: "Privacy Policy")
                            profileItem(image: "cardIcon", text: "Payment Methods")
                            profileItem(image: "notificationIcon", text: "Notification")
                            profileItem(image: "settingIcon", text: "Setting")
                            profileItem(image: "helpIcon", text: "Help")
                            profileItem(image: "logoutIcon", text: "Logout")
                        }
                        .padding(.horizontal, 32)
                        .padding(.top, 12)
                        Spacer()
                    }
                }
            }
        }
    }
}


struct profileItem: View {
     var image: String
     var text: String
   
    var body: some View {
        
        HStack{
            Image(image)
            Text(text)
                .font(.poppinsBold(size: 20))
                .foregroundColor(.white)
        }
        .padding(.top, 12)
        
    }
}


#Preview {
    ProfileScreen(selectedTab: .constant(.home))
        .environmentObject(CartViewModel())
}
