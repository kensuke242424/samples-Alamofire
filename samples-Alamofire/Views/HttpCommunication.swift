//
//  AlamofireView.swift
//  samples-Alamofire
//
//  Created by Kensuke Nakagawa on 2023/10/19.
//

import SwiftUI
import Alamofire

/// Alamofireを用いたHTTP通信でのデータ取得サンプル
struct HttpCommunication: View {
    var body: some View {
        Button {
            getArticles()
        } label: {
            Text("get")
        }
    }
    func getArticles() {
        /// AFの実態 -> Session.default
        /// AF.request() -> Alamofireによるリクエストの送信
        /// .request -> 引数にURLやHTTPメソッド、パラメータを渡すことで任意のリクエストを送信
        /// .response -> レスポンスを参照
        AF.request("https://tech.amefure.com/api/article")
            .response { response in
            do {
                // JSONオブジェクトからデータ型のインスタンスをデコードするオブジェクト
                let decoder = JSONDecoder()
                // .decode -> JSONオブジェクトからデコードした指定データ型の値を返す
                let articles: [Article] = try decoder.decode([Article].self, from: response.data!)
                print(articles)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    HttpCommunication()
}
