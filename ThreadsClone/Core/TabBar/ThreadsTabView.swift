//
//  ThreadsTabView.swift
//  ThreadsClone
//
//  Created by Luka  Kharatishvili on 01.09.23.
//

import SwiftUI

struct ThreadsTabView: View {
    @State private var selectedTab = 0
    @State private var previousTab = 0
    @State private var showCreateThreadView = false
    @Environment(\.dismiss) var dismiss

    var body: some View {
        TabView(selection: $selectedTab) {
            FeedView()
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                }
                .onAppear { selectedTab = 0; previousTab = selectedTab
                }
                .tag(0)

            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .onAppear { selectedTab = 1; previousTab = selectedTab }
                .tag(1)

            Text("")
                .tabItem {
                    Image(systemName: "plus")
                }
                .onAppear { selectedTab = 2 }
                .tag(2)

            ActivityView()
                .tabItem {
                    Image(systemName: selectedTab == 3 ? "heart.fill" : "heart")
                        .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                }
                .onAppear { selectedTab = 3; previousTab = selectedTab }
                .tag(3)

            CurrentUserProfileView()
                .tabItem {
                    Image(systemName: selectedTab == 4 ? "person.fill" : "person")
                        .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                }
                .onAppear { selectedTab = 4; previousTab = selectedTab }
                .tag(4)
        }

        .onChange(of: selectedTab, perform: { _ in
            showCreateThreadView = selectedTab == 2
        })
        .sheet(isPresented: $showCreateThreadView, onDismiss: {
            selectedTab = previousTab
            print("DEBUG: \(previousTab)")
        }, content: {
            CreateThreadView()
        })
        .tint(.black)
    }
}

struct ThreadsTabView_Previews: PreviewProvider {
    static var previews: some View {
        ThreadsTabView()
    }
}
