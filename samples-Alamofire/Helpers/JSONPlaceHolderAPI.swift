//
//  APIManager.swift
//  samples-Alamofire
//
//  Created by Kensuke Nakagawa on 2023/10/19.
//

import Foundation
import Alamofire

/// JSONPlaceHolderAPIとの通信を管理するクラス。
class JSONPlaceHolderAPI {
    // 自身のインスタンスを静的データとして生成している
    // 呼び出す時は、JSONPlaceHolderAPI.shared...と書く
    // アプリ内唯一のインスタンスにアクセスするためのシングルトンパターン
    static let shared = JSONPlaceHolderAPI()

    private let baseURL = "https://jsonplaceholder.typicode.com"

    /// APIの「/posts」エンドポイントからデータをGETするメソッド。（async/await）
    func fetchPostsAsync() async throws -> [Post]? {
        let postsURL = "\(baseURL)/posts"

        do {
            let data = AF.request(postsURL, method: .get)
                .serializingDecodable([Post].self)
            let response  = await data.response

            switch response.result {
            case .success(let posts):
                print(posts)
                return posts
            case .failure(let error):
                print("ERROR: \(error.localizedDescription)")
                return nil
            }
        }
    }
}

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

