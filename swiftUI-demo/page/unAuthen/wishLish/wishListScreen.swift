//
//  wishListScreen.swift
//  swiftUI-demo
//
//  Created by Đoàn Văn Quang on 21/5/25.
//

import Foundation

import SwiftUI

struct WishListScreen: View {
    @Binding var selectedTab: Tab
    @EnvironmentObject var cartVM: CartViewModel
    @Environment(\.presentationMode) var presentationMode

    @State var isData: Bool = false

    var body: some View {
        print("🛒 Cart Items:", cartVM.items)

       return NavigationStack{
            ZStack(alignment:.topLeading){
                Color(hex: 0x363130)
                    .ignoresSafeArea()
                VStack(alignment:isData ? .leading : .center){
                    HStack{
                        Image("leftIcon")
                            .onTapGesture {
                                selectedTab = .home
                                presentationMode.wrappedValue.dismiss()
                            }
                        Spacer()
                        Text("Wishlist")
                            .font(.poppinsBold(size: 20))
                            .foregroundColor(Color(hex: 0xCC7861))
                        Spacer()
                        Image("editIcon")
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 24)
                    
                    if(cartVM.items.count > 0){
                        ScrollView{
                            ForEach(cartVM.items){ item in
                                VStack(alignment: .leading){
                                    HStack(alignment:.center){
                                        ZStack(alignment:.bottomTrailing){
                                            Image(item.image)
                                                .resizable()
                                                .frame(width: 80, height: 125)
                                                .cornerRadius(12)
                                            Image("favouriteIcon")
                                                .resizable()
                                                .frame(width: 31, height: 31)
                                                .cornerRadius(12)
                                                .padding(.bottom, 8)
                                                .padding(.trailing, 8)
                                        }
                                        VStack(alignment: .leading){
                                            Text(item.name)
                                                .font(.poppinsBold(size: 15))
                                                .foregroundColor(Color(hex: 0xF4B5A4))
                                                .lineLimit(2)
                                                .fixedSize(horizontal: false, vertical: true)
                                                .frame(maxWidth: .infinity, alignment: .leading)

                                            Text(item.description)
                                                .font(.poppinsBold(size: 14))
                                                .foregroundColor(.white)
                                        }
                                        .padding(.leading, 12)
                                        
                                    }
                                    .padding(.horizontal, 24)
                                }
                            }
                        }
                                
                        
                    }else{
                        VStack(alignment:.center){
                            Spacer()
                            Image("wishListImage")
                                .resizable()
                                .fixedSize()
                            Text("Your Wishlist is Empty.")
                                .font(.poppinsMedium(size: 20))
                                .foregroundColor(.white)
                                .padding(.top, 8)
                                .multilineTextAlignment(.center)
                            Spacer()
                        }
                    }
                }
                Spacer()

            }
        }
    }
}

#Preview {
    WishListScreen(selectedTab: .constant(.home))
        .environmentObject(CartViewModel())
}
