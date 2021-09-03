//
//  ContentView.swift
//  SensoryOverload
//
//  Created by João Brentano on 02/09/21.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to")
                .fontWeight(.bold)
            Text("Sensory Overload!")
                .fontWeight(.black)
            Spacer()
            TextSectionView(title: "What is this app?", text: "     This app was made so one can check all the readings from the sensors in their Apple Devices. \n     It allows the user to view the raw values coming from the sensors and also the processed values coming from Apple's Core Motion Framework. Further explaining of it may be read in the other tabs of the app.")
            Spacer()
            TextSectionView(title: "Why?", text: "     Well, the idea was to practice using Core Motion, but why not make it a SwiftUI review and good practices exercise aswell? \n ")
            Spacer()
            TextSectionView(title: "Made by who?", text: "     This app was made by João Vianna Moog Brentano, an Apple Developer Academy student.")
            Spacer()
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .preferredColorScheme(.dark) // This is done for all subviews in HostingTabBar.swift
    }
}
