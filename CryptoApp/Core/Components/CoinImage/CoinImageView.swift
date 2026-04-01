//
//  CoinImageView.swift
//  CryptoApp
//
//  Created by Roman Romanov on 01.04.2026.
//

import SwiftUI

struct CoinImageView: View {

	private var viewModel: CoinImageViewModel

	init(coin: CoinModel) {
		viewModel = CoinImageViewModel(coin: coin)
	}

	var body: some View {
		ZStack {
			if let image = viewModel.image {
				Image(uiImage: image)
					.resizable()
					.scaledToFit()
			} else if viewModel.isLoading {
				ProgressView()
			} else {
				Image(systemName: "questionmark")
					.foregroundStyle(Color.theme.secondaryText)
			}
		}
	}
}

#Preview(traits: .sizeThatFitsLayout) {
	CoinImageView(coin: MockData.instance.coin)
		.padding()
}
