//
//  ContentView.swift
//  Landmarks
//
//  Created by Andrew on 2023/07/06.
//

import SwiftUI

// View 프로토콜을 채택하고 있는 ContentView
struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

// 오른쪽 미리보기
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
