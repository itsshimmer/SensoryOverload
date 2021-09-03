//
//  ContentView.swift
//  SensoryOverload
//
//  Created by João Brentano on 02/09/21.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("Welcome to")
                    .fontWeight(.bold)
                Text("Sensory Overload!")
                    .fontWeight(.black)
                Spacer()
            }
            .foregroundColor(.white)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .preferredColorScheme(.dark) // This is done for all subviews in HostingTabBar.swift
    }
}
