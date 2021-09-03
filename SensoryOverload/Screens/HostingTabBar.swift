//
//  HostingTabBar.swift
//  SensoryOverload
//
//  Created by João Brentano on 02/09/21.
//

import SwiftUI
import CoreMotion

// Creates a motion manager for all views
let motionManager: CMMotionManager = CMMotionManager()

struct HostingTabBar: View {
    
    private enum Tab: Hashable {
        case welcome
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
            CoreMotionView()
                .tag(1)
                .tabItem {
                    Text("Core Motion")
                    Image(systemName: "arrow.up.and.down.and.arrow.left.and.right")
                }
            DeviceMotionView()
                .tag(2)
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
