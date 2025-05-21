//
//  subCategoryScreen.swift
//  swiftUI-demo
//
//  Created by Đoàn Văn Quang on 14/5/25.
//

//  categoryScreen.swift
//  swiftUI-demo
//
//  Created by Đoàn Văn Quang on 14/5/25.
//

//
//  homeScreen.swift
//  swiftUI-demo
//
//  Created by Đoàn Văn Quang on 11/5/25.
//


import SwiftUI

struct SubCategoryScreen: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var selectedTab: Tab
    @State private var isShowTitle = false
    @State private var navigateToNextScreen = false
    @Binding var title:String
    @State private var dataDetail: Product? = nil

    func gotoDetail(_ data:Product){
        navigateToNextScreen = true
        dataDetail = data
    }
    
    let collections: [Product] = [
        Product(
            name: "Aluminum chair",
            image: "productImage1",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
            content:"Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.",
            price: "1.200",
            isFavourite: false,
            quantity: 1
        ),
        Product(
            name: "Aluminum chair",
            image: "productImage2",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
            content:"Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.",
            price: "12.000",
            isFavourite: false,
            quantity: 1
        ),
        Product(
            name: "Aluminum chair",
            image: "productImage3",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
            content:"Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.",
            price: "12.700",
            isFavourite: false,
            quantity: 1
        ),
        Product(
            name: "Aluminum chair",
            image: "productImage4",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
            content:"Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.",
            price: "22.200",
            isFavourite: false,
            quantity: 1
        ),
        Product(
            name: "Aluminum chair",
            image: "productImage3",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
            content:"Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.",
            price: "12.700",
            isFavourite: false,
            quantity: 1
        ),
        Product(
            name: "Aluminum chair",
            image: "productImage4",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
            content:"Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.",
            price: "22.200",
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
                        Image("leftIcon")
                            .onTapGesture {
                                dismiss()
                            }
                        Spacer()
                        Text(title)
                            .font(.poppinsBold(size: 20))
                            .foregroundColor(Color(hex: 0xF4B5A4))
                        Spacer()
                        Image("searchIcon")
                    }
                    ScrollView(showsIndicators: false) {
                        CollectionNew(isShowTitle: $isShowTitle, title: $title, selectedTab: $selectedTab, products: collections)
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

    SubCategoryScreen(selectedTab: $selectedTab, title: $title)
}
