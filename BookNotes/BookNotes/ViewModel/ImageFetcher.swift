//
//  ImageFetcher.swift
//  BookNotes
//
//  Created by Patrick Chen on 2021/7/3.
//

import SwiftUI
import Combine

class ImageFetcher: ObservableObject {
    
    @Published var image: UIImage?
    var urlString: String?
    var imageCache = ImageCache.getImageCache()

    init(urlString:String) {
        self.urlString = urlString
        loadImage()
    }
    
    func loadImage() {
        
        guard let cacheImage = imageCache.get(url: urlString!) else {
            return getURLImage()
        }
        
        image = cacheImage
    }
    
    func getURLImage() {
        guard let url = URL(string: urlString!) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async { [self] in
                guard let loadedImage = UIImage(data: data) else { return }
                imageCache.set(url: self.urlString!, image: loadedImage)
                self.image = loadedImage
            }
        }
        task.resume()
    }
}


//guard let url = URL(string: urlString) else { return }
//let task = URLSession.shared.dataTask(with: url) { data, response, error in
//    guard let data = data else { return }
//    DispatchQueue.main.async {
//        self.data = data
//    }
//}
//task.resume()
