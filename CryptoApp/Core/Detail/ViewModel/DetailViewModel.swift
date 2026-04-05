//
//  DetailViewModel.swift
//  CryptoApp
//
//  Created by Roman Romanov on 05.04.2026.
//

import Combine
import Foundation

final class DetailViewModel: ObservableObject {

	private let coinDetailService: CoinDetailDataService

	private var cancellables: Set<AnyCancellable> = []

	init(coin: CoinModel) {
		coinDetailService = CoinDetailDataService(coin: coin)
		addSubscribers()
	}

	private func addSubscribers() {
		coinDetailService.$coinDetails
			.sink { [weak self] returnedCoinDetails in
				print(returnedCoinDetails)
			}
			.store(in: &cancellables)
	}
}
