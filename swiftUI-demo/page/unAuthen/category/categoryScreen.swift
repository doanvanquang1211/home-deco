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

struct CategoryScreen: View {
    @Binding var selectedTab: Tab

    let items = [
        ("Decorative Light", 110),
        ("Sofa", 170),
        ("Beds", 230.0),
        ("Tables", 110),
        ("Chairs", 110),
        ("Cupboard", 230.0),
        ("Decor", 100.0),
    ]
    
    let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]
    @State private var navigateToNextScreen: Bool = false
    @State private var title: String = ""

    var body: some View {
        
        NavigationStack{
            ZStack(alignment:.topLeading){
                Color(hex: 0x363130)
                    .ignoresSafeArea()
                VStack(alignment:.leading){
                    HStack{
                        Image("leftIcon")
                            .onTapGesture {
                                selectedTab = .home
                            }
                        Spacer()
                        Text("Bedroom")
                            .font(.poppinsBold(size: 20))
                            .foregroundColor(Color(hex: 0xF4B5A4))
                        Spacer()
                        Image("searchIcon")
                    }
                    ScrollView(showsIndicators: false) {
                        HStack(alignment: .top, spacing: 12) {
                            VStack(spacing: 12) {
                                ForEach(0..<items.count, id: \.self) { index in
                                    if index % 2 == 0 {
                                        let item = items[index]
                                        Text(item.0)
                                            .font(.title3)
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity)
                                            .frame(height: item.1)
                                            .background(Color(hex: 0xF4B5A4))
                                            .cornerRadius(20)
                                            .onTapGesture {
                                                navigateToNextScreen = true
                                                self.title = item.0
                                            }
                                    }
                                }
                            }
                            VStack(spacing: 12) {
                                ForEach(0..<items.count, id: \.self) { index in
                                    if index % 2 != 0 {
                                        let item = items[index]
                                        Text(item.0)
                                            .font(.title3)
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity)
                                            .frame(height: item.1)
                                            .background(Color(hex: 0xF4B5A4))
                                            .cornerRadius(20)
                                            .onTapGesture {
                                                navigateToNextScreen = true
                                                title = item.0
                                            }
                                    }
                                }
                            }
                        }
                        .navigationDestination(isPresented: $navigateToNextScreen) {
                            SubCategoryScreen(selectedTab: $selectedTab, title:$title)
                                .navigationBarBackButtonHidden(true)
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
    @State var selectedTab: Tab = .home
    CategoryScreen(selectedTab: $selectedTab)
}
