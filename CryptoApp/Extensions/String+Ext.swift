//
//  String+Ext.swift
//  CryptoApp
//
//  Created by Roman Romanov on 05.04.2026.
//

import Foundation

extension String {

	var removingHTMLOccurances: String {
		return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
	}
}
