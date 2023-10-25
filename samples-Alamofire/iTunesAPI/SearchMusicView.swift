//
//  SearchMusicView.swift
//  samples-Alamofire
//
//  Created by Kensuke Nakagawa on 2023/10/20.
//

import SwiftUI

struct SearchMusicView: View {
    @StateObject var musicVM = MusicViewModel()
    @State private var isSearch: Bool = false
    var body: some View {
        Button("音楽を取得") {
            musicVM.getMusicsSync()
        }
        Button("音楽を取得（非同期）") {
            Task {
                await musicVM.getMusicsAsync()
            }

        }
    }
}

#Preview {
    SearchMusicView()
}
