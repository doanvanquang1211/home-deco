import SwiftUI

enum Tab {
    case home
    case category
    case Cart
    case WishList
    case profile
}
struct BottomTab: View {
    @State private var selectedTab: Tab = .home
    
    @StateObject var cartVM = CartViewModel()

    
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
        TabView(selection: $selectedTab){
            HomeScreen(selectedTab: $selectedTab)
                .tabItem {
                    Image("homeIcon")
                }
                .tag(Tab.home)
            
            CategoryScreen(selectedTab: $selectedTab)
                .tabItem {
                    Image("cateIcon")
                }
                .tag(Tab.category)
            
            CartScreen(selectedTab: $selectedTab)
                .tabItem {
                    Image("cartIcon")
                }
                .tag(Tab.Cart)
            
            WishList()
                .tabItem {
                    Image("wishListIcon")
                }
                .tag(Tab.WishList)
            
            Profile()
                .tabItem {
                    Image("profileIcon")
                }
                .tag(Tab.profile)
        }
        .accentColor(Color(hex: 0xF4B5A4))
        .environmentObject(cartVM)
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
