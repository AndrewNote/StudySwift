//
//  ProductRow.swift
//  SweetSwiftUI
//
//  Created by Andrew on 2023/08/20.
//

import SwiftUI

struct ProductRow: View {
    
    var body: some View {
        HStack {
            productImage
            productDescription
        }
        
    }
    
    var productImage: some View {
        Image("apple")
            .resizable()
            .scaledToFill()
            .frame(width: 140)
            .clipped()
    }
    
    var productDescription: some View {
        VStack(alignment: .leading) {    // 상품명, 상품설명
            Text("백설공주 사과")
                .font(.headline)
                .fontWeight(.medium)
                .padding(.bottom, 6)
            
            Text("달콤한 맛이 좋은 과일의 여왕 사과. 독은 없고 꿀만 가득해요!")
                .font(.footnote)
                .foregroundColor(.secondary)
            
            Spacer()
            footerView
            
        }
        .padding([.leading, .bottom], 12)
        .padding([.top, .trailing])
    }
    
    var footerView: some View {
        HStack(spacing: 0) {    // 가격정보, 버튼
            Text("₩").font(.footnote)
            Text("2100").font(.headline)
            Spacer()
            Image(systemName: "heart")
                .imageScale(.large)
                .foregroundColor(Color("peach"))
            // 에셋에 포함해 둔 peach 사용
                .frame(width: 32, height: 32)
            Image(systemName: "cart")
                .foregroundColor(Color("peach"))
                .frame(width: 32, height: 32)
        }
    }
    
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow()
    }
}
