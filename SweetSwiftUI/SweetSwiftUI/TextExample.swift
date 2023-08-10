//
//  TextExample.swift
//  SweetSwiftUI
//
//  Created by Andrew on 2023/08/10.
//

import SwiftUI

struct TextExample: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("폰트와 굵기 설정")
                .font(.title)       // 폰트 설정
                .fontWeight(.black) // 폰트 굵기
            
            Text("글자색은 foreground, 배경은 background")
                .foregroundColor(.white)    // 글자색
                .padding()                  // 텍스트 주변 여백 설정
                .background(.red)           // 배경색
            
            Text("커스텀 폰트, 볼드체, 이탤릭체, 밑줄, 취소선")
                .font(.custom("Menlo", size: 16))
                .bold()             // 볼드체
                .italic()           // 이탤릭체
                .underline()        // 밑줄
                .strikethrough()    // 취소선
            
            Text("라인 수 제한과 \n 텍스트 정렬 기능입니다. \n 이건 안 보임.")
                .lineLimit(2)   // 텍스트를 최대 2줄까지만 표현
                .multilineTextAlignment(.trailing)
                .fixedSize()    //
            
            Text("자간과 기준선").kerning(8)  // 자간
            Text("조정도 쉽게 가능.").baselineOffset(8)
                .font(.system(size: 16))
        }
        
    }
}

struct TextExample_Previews: PreviewProvider {
    static var previews: some View {
        TextExample()
    }
}
