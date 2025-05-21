//
//  productDetailScreen.swift
//  swiftUI-demo
//
//  Created by Đoàn Văn Quang on 14/5/25.
//


import SwiftUI

struct ProductDetailScreen: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var cartVM: CartViewModel
    @Binding var selectedTab: Tab
    @State private var goToCart = false

    @State private var isShowTitle = false
    @Binding var title : String
    var dataDetail: Product
    let rating: Double = 4.5

    var body: some View {
        
        NavigationStack{
            ZStack(alignment:.topLeading){
                Color(hex: 0x363130)
                    .ignoresSafeArea()
                VStack(alignment:.leading){
                    HStack{
                        Image("leftIcon")
                            .onTapGesture {
                                dismiss()
                            }
                        Spacer()
                        Text(title)
                            .font(.poppinsBold(size: 20))
                            .foregroundColor(Color(hex: 0xF4B5A4))
                            .multilineTextAlignment(.leading)
                        Spacer()
                        Image("searchIcon")
                    }
                    ScrollView(showsIndicators: false) {
                        VStack(alignment:.leading){
                            Image(dataDetail.image)
                                .resizable()
                                .cornerRadius(20)
                                .aspectRatio(contentMode: .fit)
                            Text(dataDetail.name)
                                .font(.poppinsBold(size: 20))
                                .foregroundColor(Color(hex: 0xF4B5A4))
                                .padding(.top, 18)
                            Text(dataDetail.content)
                                .font(.poppinsRegular(size: 13))
                                .foregroundColor(.white)
                                .padding(.top, 18)
                            Divider()
                                .background(Color(hex: 0xF4B5A4))
                                .frame(height: 1)
                                .padding(.top, 8)
                            HStack{
                                Text("$ \(dataDetail.price)")
                                    .font(.poppinsBold(size: 20))
                                    .foregroundColor(.white)
                                    .padding(.top, 4)
                                Spacer()
                                HStack{
                                    Image("favouriteIcon")
                                    Image("addIcon")
                                }
                                .padding(.trailing, 6)
                            }
                            HStack{
                                Text("Users reviews")
                                    .font(.poppinsMedium(size: 14))
                                    .foregroundColor(Color(hex: 0xF4B5A4))
                                    .padding(.top, 4)
                                Spacer()
                                StarRatingView(rating: rating)
                            }
                            Button(action: {
                                cartVM.addToCart(product: dataDetail)
                                goToCart = true
                            }) {
                                HStack {
                                    Spacer()
                                    Text("Add to Cart")
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

                            NavigationLink(
                                destination: CartScreen(selectedTab: $selectedTab)
                                    .navigationBarBackButtonHidden(true),
                                isActive: $goToCart
                            ) {
                                EmptyView()
                            }

                            
                        }
                    }
                    .padding(.top, 24)
                }
                .padding(.horizontal, 24)
                Spacer()

            }
        }
    }
}

#Preview{
    @State var title = ""
    @State var selectedTab:Tab = .home

    let sampleData = Product(
        name: "Aluminum chair",
        image: "productImage1",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
        content:"Lorem",
        price: "1.200",
        isFavourite: false,
        quantity: 1
    )
    ProductDetailScreen(selectedTab: $selectedTab, title: $title, dataDetail: sampleData)
}
