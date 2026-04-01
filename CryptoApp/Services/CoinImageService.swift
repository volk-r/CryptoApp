//
//  CoinImageService.swift
//  CryptoApp
//
//  Created by Roman Romanov on 01.04.2026.
//

import Combine
import SwiftUI

final class CoinImageService: ObservableObject {

	@Published var image: UIImage?

	private var imageSubscription: AnyCancellable?
	private let coin: CoinModel

	init(coin: CoinModel) {
		self.coin = coin
		getCoinImage()
	}

	private func getCoinImage() {
		guard let url = URL(string: coin.image) else { return }

		imageSubscription = NetworkManager.download(url: url)
			.tryMap { (data) -> UIImage? in UIImage(data: data) }
			.sink { completion in
				NetworkManager.handleCompletion(completion: completion)
			} receiveValue: { [weak self] returnedCoins in
				self?.image = returnedCoins
				self?.imageSubscription?.cancel()
			}
	}
}
