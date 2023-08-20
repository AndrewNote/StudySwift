//
//  Home.swift
//  SweetSwiftUI
//
//  Created by Andrew on 2023/08/13.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            ExtractedView()
        }
        
        
    }
}

struct ExtractedView: View {
    var body: some View {
        HStack {    // 상품 이미지
            Image("apple")
                .resizable()
                .scaledToFill()
                .frame(width: 140)
                .clipped()
            
            .frame(height: 150)
            .background(Color.primary.colorInvert())
            .cornerRadius(6)
            .shadow(color: Color.primary.opacity(0.33), radius: 1, x: 2, y: 2)
            .padding(.vertical, 8)
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
