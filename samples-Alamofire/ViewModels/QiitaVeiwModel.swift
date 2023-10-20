//
//  QiitaVeiwModel.swift
//  samples-Alamofire
//
//  Created by Kensuke Nakagawa on 2023/10/20.
//

import Foundation
import Alamofire

class ArticleViewModel: ObservableObject {
    @Published var articles: [Article] = []

    func get() {
        let url = "https://qiita.com/api/v2/items"
        let params = [
            "page": "1",
            "per_page": "10"
        ]

        // スネークケース -> キャメルケースを変換する場合、JSONDecoder を設定する
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        AF.request(url, parameters: params)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: Array<Article>.self, decoder: decoder) { response in
                switch response.result {
                case .success:
                    if let articles = response.value {
                        print("articles: \(articles)")
                    } else {
                        print("articles is nil")
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }

    func getAsync() async {
        let url = "https://qiita.com/api/v2/items"
        let params = [
            "page": "1",
            "per_page": "10"
        ]

        let dataTask = AF.request(url, parameters: params)
            // Decodable値のシリアライズを待つDataTaskを作成する
            // 返り値 -> DataTask<指定データ型>
            .serializingDecodable(Array<Article>.self)
        // DataRequestとそのレスポンスハンドラが生成するDataResponse
        let response = await dataTask.response

        switch response.result {
        case .success:
            print(response.value)
//            for music in musics {
//                self.musics.append(music)
//                print(music.trackName ?? "???")
//            }
        case .failure(let error):
            print("ERROR: \(error)")
            break
        }
    }
}
