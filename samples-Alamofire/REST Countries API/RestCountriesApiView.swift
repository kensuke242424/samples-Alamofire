//
//  RestCountriesApiView.swift
//  samples-Alamofire
//
//  Created by Kensuke Nakagawa on 2023/10/25.
//

import SwiftUI

struct RestCountriesApiView: View {
    var body: some View {
        Button("国データを取得") {
            Task {
                try await RestCountriesAPI.shared.fetchAllCountries()
            }
        }
    }
}

#Preview {
    RestCountriesApiView()
}
