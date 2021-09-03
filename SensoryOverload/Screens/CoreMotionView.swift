//
//  CoreMotionView.swift
//  SensoryOverload
//
//  Created by João Brentano on 02/09/21.
//

import SwiftUI
import CoreMotion

var motionManager: CMMotionManager!


struct CoreMotionView: View {
    
    @State var updateInterval: Double = 1
    @State var accelerometer: [Double] = [0.0, 0.0, 0.0]
    @State var gyro: [Double] = [0.0, 0.0, 0.0]
    @State var magnetometer: [Double] = [0.0, 0.0, 0.0]
    
    func startCoreMotion() {
        motionManager = CMMotionManager()
        
        // Starts Accelerometer
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = updateInterval
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
            motionManager.gyroUpdateInterval = updateInterval
            motionManager.startGyroUpdates(to: .main) { data, error in
                guard let validData = data else { return }
                var temp: [Double] = []
                temp.append(validData.rotationRate.x)
                temp.append(validData.rotationRate.y)
                temp.append(validData.rotationRate.z)
                gyro = temp
            }
        }
        
        // Starts Magnetometer
        if motionManager.isMagnetometerAvailable {
            motionManager.magnetometerUpdateInterval = updateInterval
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
        motionManager = nil
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Core Motion")
                    .fontWeight(.black)
                //MARK: - Group: Sensors
                Group {
                    Text("Accelerometer")
                        .fontWeight(.bold)
                        .padding()
                    HStack {
                        Spacer()
                        Text("X: \(accelerometer[0])")
                        Spacer()
                        Text("Y: \(accelerometer[1])")
                        Spacer()
                        Text("Z: \(accelerometer[2])")
                        Spacer()
                    }
                    Divider()
                    Text("Gyro")
                        .fontWeight(.bold)
                        .padding()
                    HStack {
                        Spacer()
                        Text("X: \(gyro[0])")
                        Spacer()
                        Text("Y: \(gyro[1])")
                        Spacer()
                        Text("Z: \(gyro[2])")
                        Spacer()
                    }
                    Divider()
                    Text("Magnetometer")
                        .fontWeight(.bold)
                        .padding()
                    HStack {
                        Spacer()
                        Text("X: \(magnetometer[0])")
                        Spacer()
                        Text("Y: \(magnetometer[1])")
                        Spacer()
                        Text("Z: \(magnetometer[2])")
                        Spacer()
                    }
                    Divider()
                }
                //MARK: - Group: Refresh rate settings
                Group {
                    HStack {
                        Text("100Hz")
                        Spacer()
                        Text("Refresh Rate")
                            .fontWeight(.bold)
                        Spacer()
                        Text("1Hz")
                    }
                    .padding(.top)
                    Slider(value: $updateInterval, in: 1/100...1)
                        .padding([.leading, .bottom, .trailing])
                        .accentColor(.purple)
                    Button(action: {
                        stopCoreMotion()
                        startCoreMotion()
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
                //MARK: - Group: What is Core Motion?
                Group {
                    Text("What is Core Motion?")
                        .fontWeight(.bold)
                        .padding([.leading, .bottom, .trailing])
                    Text("\"Core Motion reports motion and environment-related data from the onboard hardware of iOS devices, including from the accelerometers and gyroscopes, and from the pedometer, magnetometer, and barometer.\" - Apple Docs \n\n The values shown here are processed values by the Core Motion Apple Framework, so that bias induced by the environment is as supressed as possible.")
                        .padding([.leading, .trailing])
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
        .foregroundColor(.white)
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
