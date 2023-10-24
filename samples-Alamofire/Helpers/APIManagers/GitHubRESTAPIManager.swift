//
//  GitHubRESTAPIManager.swift
//  samples-Alamofire
//
//  Created by Kensuke Nakagawa on 2023/10/24.
//

import Foundation
import Alamofire

class GithubRestAPI {
    // シングルトンパターン
    static let shared = GithubRestAPI()

    let baseURL = "https://api.github.com"

    func fetchRepositories(query: String) async throws -> [Repository]? {
        let searchRepositoriesPath = "/search/repositories?q=\(query)"

        do {
            let data = AF.request(baseURL + searchRepositoriesPath, method: .get)
                // MEMO: ([Repository].self)だと取得ができなかった
                // ラッパーリストモデルとしてRepositoryResponseを作成し指定することで、取得成功
                .serializingDecodable(RepositoryResponse.self)
            let response = await data.response

            switch response.result {
            case .success:
                print(response.value)
                return response.value?.items
            case .failure(let error):
                print(error.localizedDescription)
                throw error
            }
        }
    }
}

/// id: リポジトリの一意の識別子。
/// name: リポジトリの名前。
/// fullName: リポジトリのフルネーム（所有者/リポジトリ名）。
/// description: リポジトリの説明（オプションでnullが許容されている）。
/// owner: リポジトリの所有者に関する情報を保持するUser型のオブジェクト。
/// stargazersCount: リポジトリが受けたスターの数。
/// forksCount: リポジトリがフォークされた回数。
/// language: リポジトリで使用されているプログラミング言語（オプションでnullが許容されている）。
struct Repository: Codable {
    let id: Int
    let name: String
    let fullName: String
    let description: String?
    let owner: User
    let stargazersCount: Int
    let forksCount: Int
    let language: String?

    /// CodingKeysは、SwiftのCodableプロトコルを使用してJSONデータをモデルにデコード（またはエンコード）する際に、JSONキーとモデルプロパティの名前の対応を指定するために使用される列挙型
    /// JSONデータとモデルのプロパティ名が一致しない場合、CodingKeysを使用して名前の対応を提供することが必要である
    /// 例えば、"fullName"プロパティはJSONデータの中で"full_name"というキーに対応している
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case description
        case owner
        case stargazersCount = "stargazers_count"
        case forksCount = "forks_count"
        case language
    }
}

struct RepositoryResponse: Codable {
    let items: [Repository]
}

/// id: ユーザーの一意の識別子。
/// login: ユーザー名。
/// name: ユーザーの表示名（オプションでnullが許容されています）。
/// avatarURL: ユーザーのアバター（プロフィール画像）のURL。
/// bio: ユーザーの自己紹介（オプションでnullが許容されています）。
struct User: Codable {
    let id: Int
    let login: String
    let name: String?
    let avatarURL: URL
    let bio: String?

    enum CodingKeys: String, CodingKey {
        case id
        case login
        case name
        case avatarURL = "avatar_url"
        case bio
    }
}
