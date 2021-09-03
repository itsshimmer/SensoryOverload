//
//  CoreMotionView.swift
//  SensoryOverload
//
//  Created by João Brentano on 02/09/21.
//

import SwiftUI

var coreMotionRefreshRate: Double = 1.0

struct CoreMotionView: View {
    
    @State var accelerometer: [Double] = [0.0, 0.0, 0.0]
    @State var gyroscope: [Double] = [0.0, 0.0, 0.0]
    @State var magnetometer: [Double] = [0.0, 0.0, 0.0]
    
    func startCoreMotion() {
        
        // Starts Accelerometer
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = coreMotionRefreshRate
            motionManager.startAccelerometerUpdates(to: .main) { data, error in
                guard let validData = data else { return }
                var temp: [Double] = []
                temp.append(validData.acceleration.x)
                temp.append(validData.acceleration.y)
                temp.append(validData.acceleration.z)
                accelerometer = temp
            }
        }
        
        // Starts Gyro
        if motionManager.isGyroAvailable {
            motionManager.gyroUpdateInterval = coreMotionRefreshRate
            motionManager.startGyroUpdates(to: .main) { data, error in
                guard let validData = data else { return }
                var temp: [Double] = []
                temp.append(validData.rotationRate.x)
                temp.append(validData.rotationRate.y)
                temp.append(validData.rotationRate.z)
                gyroscope = temp
            }
        }
        
        // Starts Magnetometer
        if motionManager.isMagnetometerAvailable {
            motionManager.magnetometerUpdateInterval = coreMotionRefreshRate
            motionManager.startMagnetometerUpdates(to: .main) { data, error in
                guard let validData = data else { return }
                var temp: [Double] = []
                temp.append(validData.magneticField.x)
                temp.append(validData.magneticField.y)
                temp.append(validData.magneticField.z)
                magnetometer = temp
            }
        }
    }
    
    func stopCoreMotion() {
        motionManager.stopAccelerometerUpdates()
        motionManager.stopGyroUpdates()
        motionManager.stopMagnetometerUpdates()
    }
    
    func restartCoreMotion(newRefreshRate: Double) {
        coreMotionRefreshRate = newRefreshRate
        stopCoreMotion()
        startCoreMotion()
    }
    
    var body: some View {
        ScrollView {
            VStack {
                TitleView(title: "Core Motion")
                
                //MARK: - Sensors
                XyzSensorView(title: "Accelerometer", xyzValues: $accelerometer)
                XyzSensorView(title: "Gyroscope", xyzValues: $gyroscope)
                XyzSensorView(title: "Magnetometer", xyzValues: $magnetometer)
                
                //MARK: - Refresh rate settings
                RefreshRateSelector(restartCoreMotion: restartCoreMotion(newRefreshRate:))
                
                //MARK: - What is Core Motion?
                TextSectionView(title: "What is Core Motion?", text: "\"Core Motion reports motion and environment-related data from the onboard hardware of iOS devices, including from the accelerometers and gyroscopes, and from the pedometer, magnetometer, and barometer.\" - Apple Docs \n\n The values shown here are processed values by the Core Motion Apple Framework, so that bias induced by the environment is as supressed as possible.")
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

struct CoreMotionView_Previews: PreviewProvider {
    static var previews: some View {
        CoreMotionView()
            .preferredColorScheme(.dark) // This is done for all subviews in HostingTabBar.swift
    }
}
