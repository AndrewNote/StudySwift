//
//  LansmarkList.swift
//  Landmarks
//
//  Created by Andrew on 2023/07/15.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            List(landmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LansmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
