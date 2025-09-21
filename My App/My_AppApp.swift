//
//  My_AppApp.swift
//  My App
//
//  Created by Kailey Liou on 8/10/25.
//

import SwiftUI
import UserNotifications

@main
struct My_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                        if let error = error {
                            print("Notification permission error: \(error)")
                        }
                        print("Permission granted: \(granted)")
                    }
                }
        }
    }
}
