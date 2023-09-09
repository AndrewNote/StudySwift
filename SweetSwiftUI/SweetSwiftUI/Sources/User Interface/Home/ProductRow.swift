//
//  ProductRow.swift
//  SweetSwiftUI
//
//  Created by Andrew on 2023/08/20.
//

import SwiftUI
// 작은 뷰 하나를 만들어서 재사용하는게 목표 UIKit에 TableViewCell과 같은거

struct ProductRow: View {
    let product: Product
    
    var body: some View {
        HStack {    // View의 가장 바깥쪽 부분
            productImage
            productDescription
        }
    }
}

private extension ProductRow {
    var productImage: some View {   // 상품 이미지
        Image(product.imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 140)  // 이미지 가로 140
            .clipped()          // 뷰를 벗어나는 이미지를 자름
    }
    
    var productDescription: some View { // 상품명, 상품설명
        VStack(alignment: .leading) {
            Text(product.name)
                .font(.headline)
                .fontWeight(.medium)
                .padding(.bottom, 6)
            
            Text(product.description)
                .font(.footnote)
                .foregroundColor(Color.secondary)

            Spacer()
            footerView  // 가격정보, 버튼
            
        }
        .padding([.leading, .bottom], 12)
        .padding([.top, .trailing])
        // 상하좌우 각각 여백을 줄 방향을 선택하고 숫자를 적는다
        // 상하를 한꺼번에 줄 때 .vertical 좌우는 .horizontal도 가능
    }
    
    var footerView: some View { // 가격정보, 버튼
        HStack(spacing: 0) {
            Text("₩").font(.footnote)
            Text("\(product.price)").font(.headline)
            Spacer()
            Image(systemName: "heart")
                .imageScale(.large)
                .foregroundColor(Color.peach)
                // 에셋에 넣어둔 peach 컬러 사용
                .frame(width: 32, height: 32)
            Image(systemName: "cart")
                .foregroundColor(Color("peach"))
                .frame(width: 32, height: 32)
        }
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(product: productSamples[0])
    }
}
