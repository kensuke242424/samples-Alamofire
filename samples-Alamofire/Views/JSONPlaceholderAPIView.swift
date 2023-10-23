//
//  JSONPlaceholderAPIView.swift
//  samples-Alamofire
//
//  Created by Kensuke Nakagawa on 2023/10/23.
//

import SwiftUI

struct JSONPlaceholderAPIView: View {
    var body: some View {
        Button("データ取得"){
            Task {
                try await JSONPlaceHolderAPI.shared.fetchPosts()
            }
        }
    }
}

#Preview {
    JSONPlaceholderAPIView()
}
