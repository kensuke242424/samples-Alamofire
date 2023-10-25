//
//  SearchQiitaView.swift
//  samples-Alamofire
//
//  Created by Kensuke Nakagawa on 2023/10/20.
//

import SwiftUI

struct SearchQiitaView: View {
    @StateObject var articleVM = ArticleViewModel()
    var body: some View {
        Button("記事を取得(同期)") {
            articleVM.get()
        }
        Button("記事を取得(非同期)") {
            Task {
                await articleVM.getAsync()
            }
        }
    }
}

#Preview {
    SearchQiitaView()
}
