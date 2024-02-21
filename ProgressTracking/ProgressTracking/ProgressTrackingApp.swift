//
//  ProgressTrackingApp.swift
//  ProgressTracking
//
//  Created by Iñaki Yabar Bilbao on 21/02/2024.
//

import SwiftUI

@main
struct ProgressTrackingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(activities: Activities(items: []))
        }
    }
}
