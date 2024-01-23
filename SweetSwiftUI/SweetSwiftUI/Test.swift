//
//  Test.swift
//  SweetSwiftUI
//
//  Created by Andrew on 2023/09/08.
//

import SwiftUI

struct Test: View {
    var body: some View {
        HStack(spacing: 30) {
            Image(systemName: "book.fill").imageScale(.small).foregroundColor(.red)
            Image(systemName: "book.fill").imageScale(.small).foregroundColor(.blue)
            Image(systemName: "book.fill").imageScale(.small).foregroundColor(.green)
        }
        
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}

