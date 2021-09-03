//
//  RefreshRateSelector.swift
//  SensoryOverload
//
//  Created by João Brentano on 02/09/21.
//

import SwiftUI

struct RefreshRateSelector: View {
    
    @State var refreshRate: Double = 1.0
    var restartCoreMotion: (Double) -> Void
    
    var body: some View {
        VStack {
            HStack {
                Text("100Hz")
                Spacer()
                Text("Refresh Rate")
                    .fontWeight(.bold)
                Spacer()
                Text("1Hz")
            }
            .padding(.top)
            Slider(value: $refreshRate, in: 1/100...1)
                .padding([.leading, .bottom, .trailing])
                .accentColor(.purple)
            Button(action: {
                restartCoreMotion(refreshRate)
            }, label: {
                ZStack {
                    RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                        .foregroundColor(.purple)
                    Text("Set refresh rate")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                .padding(.horizontal)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.05, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            })
            Divider()
                .padding()
        }
    }
}

struct RefreshRateSelector_Previews: PreviewProvider {
    static var previews: some View {
        RefreshRateSelector(refreshRate: 1.0, restartCoreMotion: { data in
            
        })
            .preferredColorScheme(.dark) // This is done for all subviews in HostingTabBar.swift
    }
}
