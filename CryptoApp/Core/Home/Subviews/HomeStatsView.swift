//
//  HomeStatsView.swift
//  CryptoApp
//
//  Created by Roman Romanov on 03.04.2026.
//

import SwiftUI

struct HomeStatsView: View {

	@EnvironmentObject private var viewModel: HomeViewModel
	@Binding var showPortfolio: Bool

    var body: some View {
		GeometryReader { geo in
			HStack {
				ForEach(viewModel.statistics) { stat in
					StatisticView(stat: stat)
						.frame(width: (geo.size.width - 16) / 3)
				}
			}
			.frame(
				width: geo.size.width,
				alignment: showPortfolio ? .trailing : .leading
			)
		}
		.frame(height: 60)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
	HomeStatsView(showPortfolio: .constant(false))
		.environmentObject(MockData.instance.homeVM)
}
