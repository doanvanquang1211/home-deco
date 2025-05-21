//
//  cartScreen.swift
//  swiftUI-demo
//
//  Created by Đoàn Văn Quang on 15/5/25.
//

import SwiftUI

struct CartScreen: View {
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
                        Text("My Cart")
                            .font(.poppinsBold(size: 20))
                            .foregroundColor(Color(hex: 0xCC7861))
                        Spacer()
                        Image("editIcon")
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 24)
                   
                    if(cartVM.items.count > 0){
                        ScrollView{
                            ForEach(cartVM.items){ value in
                                HStack{
                                    Image(value.image)
                                        .resizable()
                                        .frame(width:65, height: 65)
                                    VStack(alignment: .leading){
                                        Text(value.name)
                                            .font(.poppinsRegular(size: 15))
                                            .foregroundColor(Color(hex: 0xF4B5A4))
                                        Text("$\(value.price)")
                                            .font(.poppinsRegular(size: 13))
                                            .foregroundColor(.white)
                                    }
                                    .padding(.leading, 8)
                                    
                                    Spacer()
                                    HStack{
                                        Image("descreenIcon")
                                            .resizable()
                                            .frame(width:22, height: 22)
                                            .onTapGesture {
                                                cartVM.decreaseQuantity(of: value)
                                            }
                                        Text("\(value.quantity)")
                                            .font(.poppinsRegular(size: 15))
                                            .foregroundColor(.white)
                                        Image("addIcon")
                                            .resizable()
                                            .frame(width:22, height: 22)
                                            .onTapGesture {
                                                cartVM.addToCart(product: value)
                                            }
                                    }
                                }
                                .padding(.horizontal, 24)
                                .padding(.top, 12)
                            }
                            Divider()
                                .background(Color(hex: 0xF4B5A4))
                                .frame(height: 1)
                                .padding(.bottom, 18)
                                .padding(.top, 18)
                                .padding(.horizontal, 24)
                            VStack{
                                HStack{
                                    Text("Subtotal")
                                        .font(.poppinsRegular(size: 15))
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text(cartVM.formatCurrency(cartVM.total))
                                        .font(.poppinsRegular(size: 15))
                                        .foregroundColor(Color(hex: 0xF4B5A4))
                                }
                                .padding(.bottom, 18)
                                HStack{
                                    Text("Tax And Frees")
                                        .font(.poppinsRegular(size: 15))
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text("$2.000")
                                        .font(.poppinsRegular(size: 15))
                                        .foregroundColor(Color(hex: 0xF4B5A4))
                                }
                                .padding(.bottom, 18)
                                HStack{
                                    Text("Delivery")
                                        .font(.poppinsRegular(size: 15))
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text("$10.000")
                                        .font(.poppinsRegular(size: 15))
                                        .foregroundColor(Color(hex: 0xF4B5A4))
                                }
                                .padding(.bottom, 12)
                                Divider()
                                    .background(Color(hex: 0xF4B5A4))
                                    .frame(height: 2)
                                    .padding(.bottom, 18)
                                HStack{
                                    Text("Total")
                                        .font(.poppinsRegular(size: 15))
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text(cartVM.formatCurrency(cartVM.total + 2000 + 10000))
                                        .font(.poppinsRegular(size: 15))
                                        .foregroundColor(Color(hex: 0xF4B5A4))
                                }
                            }
                            .padding(.horizontal, 24)
                            HStack{
                                Spacer()
                                Text("Check Out")
                                    .font(.poppinsMedium(size: 20))
                                    .foregroundColor(Color(hex: 0xF4B5A4))
                                    .padding(.top, 4)
                                    .padding(.vertical, 8)
                                Spacer()
                            }
                            .background(Color(hex: 0x4B4544))
                            .cornerRadius(23)
                            .padding(.horizontal, 65)
                            .padding(.top, 24)
                        }
                    }else{
                        VStack(alignment:.center){
                            Spacer()
                            Image("shopIcon")
                                .resizable()
                                .fixedSize()
                            Text("There are no items\n in your cart")
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
    CartScreen(selectedTab: .constant(.home))
        .environmentObject(CartViewModel())
}
