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
    @Binding var selectedTab: Tab
    let products: [Product]

    
    
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
                    ForEach(products) { value in
                        NavigationLink(
                            destination: ProductDetailScreen(selectedTab: $selectedTab, title: $title, dataDetail: value)
                                .navigationBarBackButtonHidden(true)
                        ) {
                            VStack(alignment:.leading){
                                Image(value.image)
                                    .resizable()
                                Text(value.name)
                                    .font(.poppinsMedium(size: 15))
                                    .foregroundColor(Color(hex: 0xF4B5A4))
                                    .multilineTextAlignment(.leading)
                                Text(value.description)
                                    .font(.poppinsMedium(size: 12))
                                    .foregroundColor(.white)
                                    .padding(.top, 4)
                                    .multilineTextAlignment(.leading)
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


