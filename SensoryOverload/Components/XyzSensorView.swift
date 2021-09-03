//
//  XyzSensorView.swift
//  SensoryOverload
//
//  Created by João Brentano on 02/09/21.
//

import SwiftUI

struct XyzSensorView: View {
    
    let title: String
    @Binding var xyzValues: [Double]
    
    var body: some View {
        VStack {
            Text("\(title)")
                .fontWeight(.bold)
                .padding()
            HStack {
                Spacer()
                Text("X: \(xyzValues[0])")
                Spacer()
                Text("Y: \(xyzValues[1])")
                Spacer()
                Text("Z: \(xyzValues[2])")
                Spacer()
            }
            Divider()
        }
    }
}

struct XyzSensorView_Previews: PreviewProvider {
    
    @State static var xyzValues: [Double] = [0.0, 0.0, 0.0]

    static var previews: some View {
        XyzSensorView(title: "Accelerometer", xyzValues: $xyzValues)
            .preferredColorScheme(.dark) // This is done for all subviews in HostingTabBar.swift
    }
}
