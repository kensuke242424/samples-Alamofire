//
//  APIManager.swift
//  samples-Alamofire
//
//  Created by Kensuke Nakagawa on 2023/10/19.
//

import Foundation
import Alamofire

class GetAddressManager: ObservableObject {

    @Published var address: Address?

    func getAddress(zipCode: String) {
        let baseUrlString = "http://zipcloud.ibsnet.co.jp"
        let searchPath = "/api/search"
        // サーバーに送るリクエストパラメータ（郵便番号）
        let parameters: [String: Any] = ["zipcode": zipCode]
        let headers: HTTPHeaders = ["Content-Type": "application/json"]

        AF.request(baseUrlString + searchPath, // サーチURL
                   method: .get, // HTTPメソッド
                   parameters: parameters, // リクエストパラメータ
                   // encoding -> パラメータ値を URLRequest にエンコードする際に使用する。デフォルトは URLEncoding.default
                   encoding: URLEncoding(destination: .queryString),
                   // header -> URLRequestに追加されるHTTPHeaders値。デフォルトではnil。
                   headers: headers)
            // MEMO: .responseJSONは非推薦となった。
            .responseData { response in
                guard let data = response.data else {
                    return
                }

                do {
                    self.address = try JSONDecoder().decode(Address.self, from: data)
                    print(self.address)
                } catch let error {
                    print("Error: \(error.localizedDescription)")
                }
            }
    }
}
