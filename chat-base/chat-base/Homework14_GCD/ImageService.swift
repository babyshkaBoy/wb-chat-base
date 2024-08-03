//
//  ImageService.swift
//  chat-base
//
//  Created by Азамат Баев on 31.07.2024.
//

import UIKit

class ImageService: ObservableObject {
    @Published var images: [String: UIImage] = [:]
    
    func loadImage(from url: String, completion: @escaping (UIImage?) -> Void) {
        if let cachedImage = images[url] {
            completion(cachedImage)
            return
        }
        
        guard let imageURL = URL(string: url) else {
            completion(nil)
            return
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                let data = try Data(contentsOf: imageURL)
                if let loadedImage = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.images[url] = loadedImage
                        completion(loadedImage)
                    }
                } else {
                    DispatchQueue.main.async {
                        completion(nil)
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    print("Failed to load image: \(error.localizedDescription)")
                    completion(nil)
                }
            }
        }
    }
}


