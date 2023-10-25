//
//  SearchAddressView.swift
//  samples-Alamofire
//
//  Created by Kensuke Nakagawa on 2023/10/19.
//

import SwiftUI

struct SearchAddressView: View {

    @StateObject var addressVM = AddressViewModel()

    var body: some View {
        Button {
            addressVM.getAddress(zipCode: "5940013")
        } label: {
            Text( "Get address.")
        }
    }
}

#Preview {
    SearchAddressView()
}
