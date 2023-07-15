//
//  LansmarkList.swift
//  Landmarks
//
//  Created by Andrew on 2023/07/15.
//

import SwiftUI

struct LansmarkList: View {
    var body: some View {
        List(landmarks) { landmark in
            LandmarkRow(landmark: landmark)
        }
    }
}

struct LansmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LansmarkList()
    }
}
