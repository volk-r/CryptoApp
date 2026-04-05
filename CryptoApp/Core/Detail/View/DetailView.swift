//
//  DetailView.swift
//  CryptoApp
//
//  Created by Roman Romanov on 05.04.2026.
//

import SwiftUI

struct DetailView: View {

	@StateObject private var viewModel: DetailViewModel

	init(coin: CoinModel) {
		_viewModel = StateObject(wrappedValue: DetailViewModel(coin: coin))
	}

    var body: some View {
		Text("Details")
    }
}

#Preview {
	DetailView(coin: MockData.instance.coin)
}
