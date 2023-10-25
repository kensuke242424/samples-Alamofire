//
//  MusicViewModel.swift
//  samples-Alamofire
//
//  Created by Kensuke Nakagawa on 2023/10/20.
//

import Foundation
import Alamofire

class MusicViewModel: ObservableObject {

    @Published var musics: [Music] = []

    func getMusicsAsync() async {
        Task {
            await self.searchAsync()
        }
    }

    func getMusicsSync() {
        self.searchSync()

    }
    /// iTunes APIを叩いて、音楽データを取得するメソッド（非同期）
    @MainActor private func searchAsync() async {
        // 初期化
        musics.removeAll()
        // MEMO: 「"」「\」などの特殊文字をリテラルに含みたい場合は、文字の前にバックスラッシュ「\」をつける
        // 例: 「"」 -> 「\"」  「\」 -> 「\\」
        let urlString = "https://itunes.apple.com/search?term=\\oneokrock&entity=song&contry=jp"

        let dataTask = AF.request(urlString, method: .get, encoding: URLEncoding(destination: .queryString))
            // Decodable値のシリアライズを待つDataTaskを作成する
            // 返り値 -> DataTask<指定データ型>
            .serializingDecodable(Music.self)
        // DataRequestとそのレスポンスハンドラが生成するDataResponse
        let response = await dataTask.response

        switch response.result {
        case .success(let music):
            print(music)
//            for music in musics {
//                self.musics.append(music)
//                print(music.trackName ?? "???")
//            }
        case .failure(let error):
            print("ERROR: \(error)")
            break
        }
    }




    private func searchSync() {
        musics.removeAll()
        let urlString = "https://itunes.apple.com/search?term=oneokrock&entity=song&contry=jp"
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        AF.request(urlString)
            .responseDecodable(of: Array<Music>.self, decoder: decoder) { response in

                switch response.result {
                case .success(let data):
                    print("Success!!")
                    print(data)
                case .failure(let error):
                    print(error)
                }
            }
    }
}
