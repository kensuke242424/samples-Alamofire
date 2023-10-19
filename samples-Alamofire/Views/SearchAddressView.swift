//
//  SearchAddressView.swift
//  samples-Alamofire
//
//  Created by Kensuke Nakagawa on 2023/10/19.
//

import SwiftUI

struct SearchAddressView: View {

    @StateObject var manager = GetAddressManager()

    var body: some View {
        Button {
            manager.getAddress(zipCode: "5940013")
        } label: {
            Text( "Get address.")
        }
    }
}

#Preview {
    SearchAddressView()
}
