//
//  SingleValueView.swift
//  SensoryOverload
//
//  Created by João Brentano on 03/09/21.
//

import SwiftUI

struct SingleValueView: View {
    
    let preText: String
    let postText: String
    @Binding var value: Double
    
    var body: some View {
        VStack {
            Text("\(preText): \(value)\(postText)")
                .fontWeight(.bold)
                .padding()
            Divider()
        }
    }
}

struct SingleValueView_Previews: PreviewProvider {
    
    @State static var value = 0.0
    
    static var previews: some View {
        SingleValueView(preText: "Heading", postText: "°", value: $value)
            .preferredColorScheme(.dark) // This is done for all subviews in HostingTabBar.swift
    }
}
