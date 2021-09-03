//
//  TextSectionView.swift
//  SensoryOverload
//
//  Created by João Brentano on 03/09/21.
//

import SwiftUI

struct TextSectionView: View {
    
    let title: String
    let text: String
    
    var body: some View {
        VStack {
            Text("\(title)")
                .fontWeight(.bold)
                .padding([.leading, .bottom, .trailing])
            Text("\(text)")
                .padding([.leading, .trailing])
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

struct TextSectionView_Previews: PreviewProvider {
    static var previews: some View {
        TextSectionView(title: "What is Core Motion?", text: "\"Core Motion reports motion and environment-related data from the onboard hardware of iOS devices, including from the accelerometers and gyroscopes, and from the pedometer, magnetometer, and barometer.\" - Apple Docs \n\n The values shown here are processed values by the Core Motion Apple Framework, so that bias induced by the environment is as supressed as possible.")
            .preferredColorScheme(.dark) // This is done for all subviews in HostingTabBar.swift
    }
}
