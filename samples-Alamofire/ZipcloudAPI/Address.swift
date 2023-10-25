//
//  Address.swift
//  samples-Alamofire
//
//  Created by Kensuke Nakagawa on 2023/10/19.
//

import Foundation

/// 住所データを格納するモデル
struct Address: Decodable {
    var results: [Result]

    struct Result: Decodable {
        var address1: String
        var address2: String
        var address3: String
        var kana1: String
        var kana2: String
        var kana3: String
    }
}
