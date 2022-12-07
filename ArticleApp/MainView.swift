//
//  MainView.swift
//  IconSplashSwiftUI
//
//  Created by Tiara H on 29/11/22.
//

import SwiftUI

struct MainView: View {
    // MARK: -PROPERTIES
    @State private var selectedTab: Tabs = .browser
    
    // MARK: -BODY
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTab) {
               ArticleListView()
                
                .listStyle(.plain)
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Browse")
                }
                .tag(Tabs.browser)
                    
                
//                VStack {
//                    Text("Gallery".uppercased())
//                        .font(.system(.largeTitle, design: .rounded))
//                    
//                    Button {
//                        selectedTab = Tabs.settings
//                    } label: {
//                        Text("Show Settings")
//                            .font(.system(.headline, design: .rounded))
//                    }
//                }
                
                GalleryView()
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Gallery")
                }
                .tag(Tabs.gallery)
                
                
                LoanListView()
                    .tabItem {
                        Image(systemName: "rectangle.and.text.magnifyingglass")
                        Text("Loans")
                    }
                    .tag(Tabs.loans)
                
                SettingsView()
                    .tabItem {
                        Image(systemName: "slider.horizontal.3")
                        Text("Setting")
                    }
                    .tag(Tabs.settings)
                
            } //: TABVIEW
            .tint(.purple)
            .navigationTitle(selectedTab.rawValue.capitalized)
            .navigationBarTitleDisplayMode(.inline)
            
        } //: NAVIGATION
        
    }
}

// MARK: -PREVIEW
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

// MARK: - ENUM
enum Tabs: String {
    case browser
    case gallery
    case loans
    case settings
}
