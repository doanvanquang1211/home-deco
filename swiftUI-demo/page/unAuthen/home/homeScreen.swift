//
//  homeScreen.swift
//  swiftUI-demo
//
//  Created by Đoàn Văn Quang on 11/5/25.
//



import SwiftUI

struct HomeScreen: View {
    @State private var isShowTitle = true
    @State private var navigateToNextScreen = false
    @State private var title = "New Collection"
    @State private var dataDetail: Product? = nil
    @Binding var selectedTab: Tab

    func gotoDetail(_ data:Product){
        navigateToNextScreen = true
        dataDetail = data
    }
    
    let collections: [Product] = [
        Product(
            name: "CADIZ Low armchair",
            image: "productImage7",
            description: "Vải bọc mềm, phù hợp với không gian phòng khách hoặc lounge hiện đại",
            content:"Ghế bành thấp (Low armchair), Màu be với gối tựa vàng nghệ, Khung kim loại mảnh, kiểu dáng hiện đại. ",
            price: "1200",
            isFavourite: false,
            quantity: 1
        ),
        Product(
            name: "Aluminum chair",
            image: "productImage5",
            description: "Lorem ipsum dolor sit amet,consectetur adipiscing elit",
            content:"Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.",
            price: "12000",
            isFavourite: false,
            quantity: 1
        ),
        Product(
            name: "Aluminum chair",
            image: "productImage8",
            description: "Lorem ipsum dolor sit amet,consectetur adipiscing elit",
            content:"Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.",
            price: "12700",
            isFavourite: false,
            quantity: 1
        ),
        Product(
            name: "Aluminum chair",
            image: "productImage9",
            description: "Lorem ipsum dolor sit amet,consectetur adipiscing elit",
            content:"Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.",
            price: "22200",
            isFavourite: false,
            quantity: 1
        ),
        Product(
            name: "Aluminum chair",
            image: "productImage10",
            description: "Lorem ipsum dolor sit amet,consectetur adipiscing elit",
            content:"Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.",
            price: "12.700",
            isFavourite: false,
            quantity: 1
        ),
        Product(
            name: "Aluminum chair",
            image: "productImage11",
            description: "Lorem ipsum dolor sit amet,consectetur adipiscing elit",
            content:"Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.",
            price: "22200",
            isFavourite: false,
            quantity: 1
        ),
    ]

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
                            CollectionNew(isShowTitle: $isShowTitle, title: $title, selectedTab:$selectedTab, products: collections)
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
