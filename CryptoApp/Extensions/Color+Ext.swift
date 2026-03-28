//
//  Color+Ext.swift
//  CryptoApp
//
//  Created by Roman Romanov on 28.03.2026.
//

import Foundation
import SwiftUI

extension Color {
	static let theme = ColorTheme()
	static let launch = LaunchTheme()
}

struct ColorTheme {
	let accent: Color = .ThemeColors.accent
	let background: Color = .ThemeColors.background
	let green: Color = .ThemeColors.green
	let red: Color = .ThemeColors.red
	let secondaryText: Color = .ThemeColors.secondaryText
}

struct ColorTheme2 {
	let accent = Color(#colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1))
	let background = Color(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1))
	let green = Color(#colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1))
	let red = Color(#colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 1))
	let secondaryText = Color(#colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1))
}

struct LaunchTheme {
	let accent: Color = .LaunchColors.launchAccent
	let background: Color = .LaunchColors.launchBackground
}
