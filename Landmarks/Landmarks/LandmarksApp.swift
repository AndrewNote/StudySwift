//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Andrew on 2023/07/06.
//

import SwiftUI

@main   // 앱의 시작점?
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    // body 속성은 하나 이상의 장면을 반환
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
