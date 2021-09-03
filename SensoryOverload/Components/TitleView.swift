//
//  TitleView.swift
//  SensoryOverload
//
//  Created by João Brentano on 03/09/21.
//

import SwiftUI

struct TitleView: View {
    
    let title: String
    
    var body: some View {
        Text("\(title)")
            .fontWeight(.black)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "Core Motion")
            .preferredColorScheme(.dark) // This is done for all subviews in HostingTabBar.swift
    }
}
