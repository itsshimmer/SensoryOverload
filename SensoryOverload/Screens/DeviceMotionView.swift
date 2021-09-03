//
//  DeviceMotionView.swift
//  SensoryOverload
//
//  Created by João Brentano on 02/09/21.
//

import SwiftUI

var deviceMotionRefreshRate: Double = 1.0

struct DeviceMotionView: View {
    
    @State var heading: Double = 0.0
    @State var gravity: [Double] = [0.0, 0.0, 0.0]
    @State var attitude: [Double] = [0.0, 0.0, 0.0]
    @State var magneticField: [Double] = [0.0, 0.0, 0.0]
    @State var rotationRate: [Double] = [0.0, 0.0, 0.0]
    @State var userAcceleration: [Double] = [0.0, 0.0, 0.0]
    
    func startCoreMotion() {
        
        // Starts Device Motion
        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = deviceMotionRefreshRate
            motionManager.startDeviceMotionUpdates(using: .xMagneticNorthZVertical, to: .main) { data, error in
                guard let validData = data else { return }
                
                // Auxiliary vector
                var temp: [Double]
                
                // Heading
                heading = validData.heading
                
                // Gravity
                temp = []
                temp.append(validData.gravity.x)
                temp.append(validData.gravity.y)
                temp.append(validData.gravity.z)
                gravity = temp
                
                // Attitude
                temp = []
                temp.append(validData.attitude.pitch)
                temp.append(validData.attitude.yaw)
                temp.append(validData.attitude.roll)
                attitude = temp
                
                // Magnetic Field
                temp = []
                temp.append(validData.magneticField.field.x)
                temp.append(validData.magneticField.field.y)
                temp.append(validData.magneticField.field.z)
                magneticField = temp
                
                // Rotation Rate
                temp = []
                temp.append(validData.rotationRate.x)
                temp.append(validData.rotationRate.y)
                temp.append(validData.rotationRate.z)
                rotationRate = temp
                
                // User Acceleration
                temp = []
                temp.append(validData.userAcceleration.x)
                temp.append(validData.userAcceleration.y)
                temp.append(validData.userAcceleration.z)
                userAcceleration = temp
            }
        }
    }
    
    func stopCoreMotion() {
        motionManager.stopDeviceMotionUpdates()
    }
    
    func restartCoreMotion(newRefreshRate: Double) {
        deviceMotionRefreshRate = newRefreshRate
        stopCoreMotion()
        startCoreMotion()
    }
    
    var body: some View {
        ScrollView {
            VStack {
                TitleView(title: "Device Motion")
                
                //MARK: - Sensors
                SingleValueView(preText: "Heading", postText: "°", value: $heading)
                XyzSensorView(title: "Gravity", xyzValues: $gravity)
                XyzSensorView(title: "Attitude", xyzValues: $attitude)
                XyzSensorView(title: "Magnetic Field", xyzValues: $magneticField)
                XyzSensorView(title: "Rotation Rate", xyzValues: $rotationRate)
                XyzSensorView(title: "User Acceleration", xyzValues: $userAcceleration)
                
                //MARK: - Refresh rate settings
                RefreshRateSelector(restartCoreMotion: restartCoreMotion(newRefreshRate:))
                
                //MARK: - What is Device(core) Motion?
                TextSectionView(title: "What is Device Motion?", text: "Device motion is part of the Core Motion framework that reports motion and environment-related data from the onboard hardware of iOS devices, including from the accelerometers and gyroscopes, and from the pedometer, magnetometer, and barometer.\n\n The values shown here are processed values by the Core Motion Apple Framework, so that bias induced by the environment is as supressed as possible.")
            }
        }
        .onAppear {
            startCoreMotion()
        }
        .onDisappear {
            stopCoreMotion()
        }
    }
}

struct DeviceMotionView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceMotionView()
            .preferredColorScheme(.dark) // This is done for all subviews in HostingTabBar.swift
    }
}
