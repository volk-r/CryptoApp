//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Roman Romanov on 31.03.2026.
//

import Foundation

@Observable
final class HomeViewModel {

	var allCoins: [CoinModel] = []
	var portfolioCoins: [CoinModel] = []

	init() {
		DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
			self.allCoins.append(MockData.instance.coin)
			self.portfolioCoins.append(MockData.instance.coin)
		}
	}
}
