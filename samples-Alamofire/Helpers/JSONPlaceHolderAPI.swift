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
    private let postsPath = "/posts"

    /// APIの「/posts」エンドポイントからデータをGETするメソッド。（async/await）
    func fetchPostsAsync() async throws -> [Post]? {

        do {
            let data = AF.request(baseURL + postsPath, method: .get)
                .serializingDecodable([Post].self)
            let response  = await data.response

            switch response.result {
            case .success(let posts):
                print(posts)
                return posts
            case .failure(let error):
                print("AFError: \(error.localizedDescription)")
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

// 一般的なHTTPステータスコード
// 200 OK: リクエストが成功し、要求されたデータが正常に返されたことを示します。
// 201 Created: リクエストが成功し、新しいリソースが作成されたことを示します。
// 400 Bad Request: リクエストが無効であることを示し、クライアント側のエラーを示します。
// 404 Not Found: 要求されたリソースが見つからないことを示します。
// 500 Internal Server Error: サーバーでエラーが発生したことを示します。
