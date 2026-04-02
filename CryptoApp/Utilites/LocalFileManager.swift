//
//  LocalFileManager.swift
//  CryptoApp
//
//  Created by Roman Romanov on 02.04.2026.
//

import SwiftUI

final class LocalFileManager {

	static let instance = LocalFileManager()

	private init() {}

	func saveImage(image: UIImage, imageName: String, folderName: String) {
		// create folder
		createFolderIfNeeded(folderName: folderName)

		// get image for path
		guard
			let data = image.pngData(),
			let url = getURLForImage(imageName: imageName, folderName: folderName)
		else { return }

		// save image to path
		do {
			try data.write(to: url)
		} catch let error {
			print("Error saving image. ImageName: \(imageName). \(error)")
		}
	}

	func getImage(imageName: String, folderName: String) -> UIImage? {
		guard
			let imageURL = getURLForImage(imageName: imageName, folderName: folderName),
			FileManager.default.fileExists(atPath: imageURL.path)
		else {
			return nil
		}
		return UIImage(contentsOfFile: imageURL.path)
	}

	private func createFolderIfNeeded(folderName: String) {
		guard let url = getURLForFolder(folderName: folderName) else { return }

		if !FileManager.default.fileExists(atPath: folderName) {
			do {
				try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
			} catch let error {
				print("Error creating directory. FolderName: \(folderName). \(error)")
			}
		}
	}

	private func getURLForFolder(folderName: String) -> URL? {
		guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
			return nil
		}
		return url.appending(path: folderName, directoryHint: .isDirectory)
	}

	private func getURLForImage(imageName: String, folderName: String) -> URL? {
		guard let folderURL = getURLForFolder(folderName: folderName) else {
			return nil
		}
		return folderURL.appending(path: imageName + ".png", directoryHint: .notDirectory)
	}
}
