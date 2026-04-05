//
//  DetailView.swift
//  CryptoApp
//
//  Created by Roman Romanov on 05.04.2026.
//

import SwiftUI

struct DetailView: View {

	let coin: CoinModel

    var body: some View {
		Text(coin.name)
    }
}

#Preview {
	DetailView(coin: MockData.instance.coin)
}
