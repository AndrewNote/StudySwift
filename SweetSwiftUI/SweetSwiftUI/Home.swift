//
//  Home.swift
//  SweetSwiftUI
//
//  Created by Andrew on 2023/08/13.
//

import SwiftUI

struct Home: View {
    var body: some View {
        HStack {    // 상품 이미지
            Image("apple")
                .resizable()
                .scaledToFill()
                .frame(width: 140)
                .clipped()
            
            VStack(alignment: .leading) {    // 상품명, 상품설명
                Text("백설공주 사과")
                    .font(.headline)
                    .fontWeight(.medium)
                    .padding(.bottom, 6)
                
                Text("달콤한 맛이 좋은 과일의 여왕 사과. 독은 없고 꿀만 가득해요!")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
                HStack {    // 가격정보, 버튼
                    
                }
                    
            }
            
        }
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
