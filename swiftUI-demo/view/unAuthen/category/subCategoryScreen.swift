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

    @State private var isShowTitle = false
    @State private var navigateToNextScreen = false
    @Binding var title:String
    @State private var dataDetail: Collections? = nil

    func gotoDetail(_ data:Collections){
        navigateToNextScreen = true
        dataDetail = data
    }
    
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
                        CollectionNew(isShowTitle: $isShowTitle, title: $title)
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

    SubCategoryScreen(title: $title)
}
