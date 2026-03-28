//
//  ContentView.swift
//  CryptoApp
//
//  Created by Roman Romanov on 28.03.2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
				.foregroundStyle(Color.theme.red)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
