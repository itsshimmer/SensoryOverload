//
//  HostingTabBar.swift
//  SensoryOverload
//
//  Created by João Brentano on 02/09/21.
//

import SwiftUI

struct HostingTabBar: View {
    
    private enum Tab: Hashable {
        case welcome
        case rawdata
        case coremotion
        case devicemotion
    }
    
    @State private var selectedTab: Tab = .welcome
    
    var body: some View {
        TabView(selection: $selectedTab) {
            WelcomeView()
                .tag(0)
                .tabItem {
                    Text("Welcome")
                    Image(systemName: "house.fill")
                }
            RawDataView()
                .tag(1)
                .tabItem {
                    Text("Raw Data")
                    Image(systemName: "magnifyingglass")
                }
            CoreMotionView()
                .tag(2)
                .tabItem {
                    Text("Core Motion")
                    Image(systemName: "applelogo")
                }
            DeviceMotionView()
                .tag(3)
                .tabItem {
                    Text("Device Motion")
                    Image(systemName: "move.3d")
                }
        }
        .accentColor(.purple)
        .colorScheme(.dark)
    }
}

struct HostingTabBar_Previews: PreviewProvider {
    static var previews: some View {
        HostingTabBar()
    }
}
