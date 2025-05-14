//
//  CollectionNew.swift
//  swiftUI-demo
//
//  Created by Đoàn Văn Quang on 13/5/25.
//

import SwiftUI

struct CollectionNew : View {
    @Binding var isShowTitle: Bool
    @Binding var title: String

    let collections: [Collections] = [
        Collections(
            name: "Aluminum chair",
            image: "productImage1",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
            content:"Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.",
            price: "1.200",
            isFavourite: false
        ),
        Collections(
            name: "Aluminum chair",
            image: "productImage2",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
            content:"Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.",
            price: "12.000",
            isFavourite: false
        ),
        Collections(
            name: "Aluminum chair",
            image: "productImage3",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
            content:"Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.",
            price: "12.700",
            isFavourite: false
        ),
        Collections(
            name: "Aluminum chair",
            image: "productImage4",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
            content:"Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.",
            price: "22.200",
            isFavourite: false
        ),
        Collections(
            name: "Aluminum chair",
            image: "productImage3",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
            content:"Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.",
            price: "12.700",
            isFavourite: false
        ),
        Collections(
            name: "Aluminum chair",
            image: "productImage4",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
            content:"Lorem ipsum dolor sit amet consectetur. Odio neque commodo id aenean quis magna. Auctor neque id pharetra gravida. Libero scelerisque ut mauris volutpat risus nec facilisi adipiscing. Augue mollis amet.",
            price: "22.200",
            isFavourite: false
        ),
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    
    var body: some View {
        VStack(alignment:.leading){
            if(isShowTitle){
                Text("New Collection")
                    .font(.poppinsBold(size: 15))
                    .foregroundColor(Color(hex: 0xF4B5A4))
                    .padding(.top, 12)
                    .padding(.bottom, 8)
            }
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns) {
                    ForEach(collections) { value in
                        NavigationLink(
                            destination: ProductDetailScreen(title: $title, dataDetail: value)
                                .navigationBarBackButtonHidden(true)
                        ) {
                            VStack(alignment:.leading){
                                Image(value.image)
                                    .resizable()
                                Text(value.name)
                                    .font(.poppinsMedium(size: 15))
                                    .foregroundColor(Color(hex: 0xF4B5A4))
                                Text(value.description)
                                    .font(.poppinsMedium(size: 12))
                                    .foregroundColor(.white)
                                    .padding(.top, 4)
                                Divider()
                                    .background(Color(hex: 0xF4B5A4))
                                    .frame(height: 1)
                                HStack{
                                    Text("$ \(value.price)")
                                        .font(.poppinsMedium(size: 12))
                                        .foregroundColor(.white)
                                        .padding(.top, 4)
                                    Spacer()
                                    HStack{
                                        Image("favouriteIcon")
                                        Image("addIcon")
                                    }
                                    .padding(.trailing, 6)
                                }
                            }
                            .padding(.horizontal, 4)
                            .padding(.bottom, 18)
                        }
                        
                    }
                }
            }
        }
    }
}


