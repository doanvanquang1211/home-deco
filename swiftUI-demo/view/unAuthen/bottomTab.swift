import SwiftUI

struct BottomTab: View {
    
    init() {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(red: 0x4B/255, green: 0x45/255, blue: 0x44/255, alpha: 1)

            UITabBar.appearance().standardAppearance = appearance
            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
        }
    
    var body: some View {
        TabView {
            HomeScreen()
                .tabItem {
                    Image("homeIcon")
                }
            
            Category()
                .tabItem {
                    Image("cateIcon")
                }
            
            Cart()
                .tabItem {
                    Image("cartIcon")
                }
            WishList()
                .tabItem {
                    Image("wishListIcon")
                }
            
            Profile()
                .tabItem {
                    Image("profileIcon")
                }
            
        }
        .accentColor(Color(hex: 0xF4B5A4))
    }
}


struct Category: View {
    var body: some View {
        Text("Category View")
            .font(.largeTitle)
    }
}

struct Cart: View {
    var body: some View {
        Text("Cart View")
            .font(.largeTitle)
    }
}


struct WishList: View {
    var body: some View {
        Text("WishList View")
            .font(.largeTitle)
    }
}

struct Profile: View {
    var body: some View {
        Text("Profile View")
            .font(.largeTitle)
    }
}

#Preview{
    BottomTab()
}
