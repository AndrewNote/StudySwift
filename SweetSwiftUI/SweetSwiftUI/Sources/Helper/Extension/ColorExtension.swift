//
//  ColorExtension.swift
//  SweetSwiftUI
//
//  Created by Andrew on 2023/08/22.
//

import SwiftUI

extension Color {
    static let peach = Color("peach")    // 앱 메인색
    static let primaryShadow = Color.primary.opacity(0.2)   // 그림자에 사용할 색
    static let secondaryText = Color(hex: "#6e6e6e")
    static let background = Color(UIColor.systemGray6)
    // 앱에서 배경색으로 사용.
    // systemGray6 라이트 모드에서는 연한회색 다크모드에서는 검은색에 가까운 색
    
    init(hex: String) { // #abcdef 같은 형식의 헥스코드를 이용할 수 없기 때문에 따로 생성자를 만듬
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")     // scanString은 iOS13부터 지원. # 문자 제거
        
        var rgb: UInt64 = 0 // 문자열을 Int64 타입으로 변환해 rgb 변수에 저장. 변환할 수 없다면 0을 반환.
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0  // 좌측 문자열 2개 추출
        let g = Double((rgb >> 8) & 0xFF) / 255.0   // 중간 문자열 2개 추출
        let b = Double((rgb >> 0) & 0xFF) / 255.0   // 우측 문자열 2개 추출
        self.init(red: r, green: g, blue: b)
    }
}
