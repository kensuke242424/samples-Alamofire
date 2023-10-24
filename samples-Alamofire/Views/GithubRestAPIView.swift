//
//  GithubRestAPIView.swift
//  samples-Alamofire
//
//  Created by Kensuke Nakagawa on 2023/10/24.
//

import SwiftUI

struct GithubRestAPIView: View {
    @State private var ripositories: [Repository]? = []
    var body: some View {
        VStack {

            Button("リポジトリ検索") {
                Task {
                    ripositories = try await GithubRestAPI.shared.fetchRepositories(query: "alamofire")
                }
            }
            Spacer()
        } // VSrtack
    }
}

#Preview {
    GithubRestAPIView()
}
