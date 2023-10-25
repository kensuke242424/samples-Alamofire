//
//  QiitaArticle.swift
//  samples-Alamofire
//
//  Created by Kensuke Nakagawa on 2023/10/20.
//

import Foundation

struct Article: Codable {
    let title: String
    let commentsCount: Int

//     private enum CodingKeys: String, CodingKey {
//         case title
//         // プロパティ名と JSON のキーが異なるので指定してあげる
//         case commentsCount = "comments_count"
//     }
}
