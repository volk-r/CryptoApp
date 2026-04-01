//
//  CoinRowView.swift
//  CryptoApp
//
//  Created by Roman Romanov on 30.03.2026.
//

import SwiftUI

struct CoinRowView: View {

	let coin: CoinModel
	let showHoldingsColumn: Bool

    var body: some View {
		HStack(spacing: 0) {
			leftColumn
			Spacer()
			if showHoldingsColumn {
				centerColumn
			}
			rightColumn
		}
    }
}

private extension CoinRowView {

	var leftColumn: some View {
		HStack(spacing: 0) {
			Text(coin.rank.description)
				.font(.caption)
				.foregroundStyle(Color.theme.secondaryText)
				.frame(minWidth: 30)
			CoinImageView(coin: coin)
				.frame(width: 30, height: 30)
			Text(coin.symbol.uppercased())
				.font(.headline)
				.padding(.leading, 6)
				.foregroundStyle(Color.theme.accent)
		}
	}

	var centerColumn: some View {
		VStack(alignment: .trailing) {
			Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
				.bold()
			Text((coin.currentHoldings ?? 0).asNumberString())
		}
		.foregroundStyle(Color.theme.accent)
	}

	var rightColumn: some View {
		VStack(alignment: .trailing) {
			Text(coin.currentPrice.asCurrencyWith6Decimals())
				.bold()
				.foregroundStyle(Color.theme.accent)
			Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
				.foregroundStyle(
					(coin.priceChangePercentage24H ?? 0) >= 0
					? Color.theme.green
					: Color.theme.red
				)
		}
		.containerRelativeFrame(
			[.horizontal], alignment: .trailing
		) { length, axis in
			axis == .horizontal ? length / 3.5 : length
		}
	}
}

#Preview(traits: .sizeThatFitsLayout) {
	CoinRowView(coin: MockData.instance.coin, showHoldingsColumn: true)
}
