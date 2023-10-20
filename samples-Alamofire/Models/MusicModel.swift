//
//  MusicModel.swift
//  samples-Alamofire
//
//  Created by Kensuke Nakagawa on 2023/10/20.
//

import Foundation

struct Music: Codable {
    // トラックID。Lookup APIのパラメータの値として利用する。
//    let trackId: String
    // アーティスト名。監督名。
    let artistName: String?
    // トラック名。映画名。
    let trackName: String?
//    // 検閲されたトラック名。映画名。
    let trackCensoredName: String?
//    // App Store内の、作品ページのパーマリンク。
    let trackViewUrl: URL?
//    // プレビューファイルのURLアドレス。
    let previewUrl: URL?
//    // アートワーク。パッケージ画像。サイズは数種類ある。
    let artworkUrl100: URL?
//    // パッケージの料金。
    let collectionPrice: Int?
//    // トラックの料金。
    let trackPrice: Int?
//    // トラック(HD)の料金。
    let trackHdPrice: Int?
//    // トラックのレンタル料金。
    let trackRentalPrice: Int?
//    // トラック(HD)のレンタル料金。
    let trackHdRentalPrice: Int?
//    // 発売日。
    let releaseDate: Date?
//    // 作品の時間(ミリ秒)。
    let trackTimeMillis: String?
//    // 国。
    let country: String?
//    // 通貨。
    let currency: String?
//    // ジャンル。
    let primaryGenreName: String?
//    // 年齢制限。
    let contentAdvisoryRating: Int?
//    // 作品の説明。
    let longDescription: String?

}
