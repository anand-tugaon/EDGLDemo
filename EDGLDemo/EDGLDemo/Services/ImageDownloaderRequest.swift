//
//  ImageDownloaderRequest.swift
//  EDGLDemo
//
//  Created by Anand Tugaon on 05/12/22.
//

import Foundation
import UIKit

final class ImageDownloaderRequest: ObservableObject {
    @Published var displayImage: UIImage?
    private var imageUrl: String?
    private var cachedImage = CachedImage.getCachedImage()
    
    func getImage(imageUrl: String?) {
        self.imageUrl = imageUrl
        if imageFromCache() {
            return
        }
        imageFromRemoteUrl()
    }
    
   private func imageFromCache() -> Bool {
        guard let url = imageUrl, let cacheImage = cachedImage.get(key: url) else {
            return false
        }
        displayImage = cacheImage
        return true
    }
    
    private func imageFromRemoteUrl() {
        guard let url = imageUrl else {
            return
        }
        
        let imageURL = URL(string: url)!
        
        URLSession.shared.dataTask(with: imageURL, completionHandler: { (data, response, error) in
            if let data = data {
                DispatchQueue.main.async {
                    guard let remoteImage = UIImage(data: data) else {
                        return
                    }
                    
                    self.cachedImage.set(key: self.imageUrl!, image: remoteImage)
                    self.displayImage = remoteImage
                }
            }
        }).resume()
    }
}


class CachedImage {
    var cache = NSCache<NSString, UIImage>()
    
    func get(key: String) -> UIImage? {
        return cache.object(forKey: NSString(string: key))
    }
    
    func set(key: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: key))
    }
}

extension CachedImage {
    private static var cachedImage = CachedImage()
    static func getCachedImage() -> CachedImage {
        return cachedImage
    }
}
