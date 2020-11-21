//
//  UserInputRow.swift
//  InstagramLikeApp
//
//  Created by Vania Radmila Alfitri on 08/11/20.
//

import SwiftUI

struct UserInputRow: View {
    var body: some View {
        HStack {
            HStack(spacing: 8) {
                Image(systemName: "heart")
                Image(systemName: "message")
                Image(systemName: "star")
            }
            Spacer()
            Image(systemName: "bookmark")
        }
    }
}

struct UserInputRow_Previews: PreviewProvider {
    static var previews: some View {
        UserInputRow()
    }
}
