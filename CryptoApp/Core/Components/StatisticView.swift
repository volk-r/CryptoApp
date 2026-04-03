//
//  StatisticView.swift
//  CryptoApp
//
//  Created by Roman Romanov on 03.04.2026.
//

import SwiftUI

struct StatisticView: View {

	let stat: StatisticModel

    var body: some View {
		VStack(alignment: .leading, spacing: 4) {
			Text(stat.title)
				.font(.caption)
				.foregroundStyle(Color.theme.secondaryText)
			Text(stat.value)
				.font(.headline)
				.foregroundStyle(Color.theme.accent)

			HStack(spacing: 4) {
				Image(systemName: "triangle.fill")
					.font(.caption2)
					.rotationEffect(
						Angle(degrees:
							isStatPercentagePositive() ? 0 : 180)
					)

				Text(stat.percentageChange?.asPercentString() ?? "")
					.font(.caption)
					.bold()
			}
			.foregroundStyle(isStatPercentagePositive() ? Color.theme.green : Color.theme.red)
			.opacity(stat.percentageChange == nil ? 0.0 : 1.0)
		}
    }
}

private extension StatisticView {

	func isStatPercentagePositive() -> Bool {
		(stat.percentageChange ?? 0) >= 0
	}
}

#Preview("Light", traits: .sizeThatFitsLayout) {
	HStack(spacing: 12) {
		StatisticView(stat: MockData.instance.stat1)
		StatisticView(stat: MockData.instance.stat2)
		StatisticView(stat: MockData.instance.stat3)
	}
	.preferredColorScheme(.light)
}

#Preview("Dark", traits: .sizeThatFitsLayout) {
	HStack(spacing: 12) {
		StatisticView(stat: MockData.instance.stat1)
		StatisticView(stat: MockData.instance.stat2)
		StatisticView(stat: MockData.instance.stat3)
	}
	.preferredColorScheme(.dark)
}
