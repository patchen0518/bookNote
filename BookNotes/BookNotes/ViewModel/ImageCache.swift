//
//  ImageCache.swift
//  BookNotes
//
//  Created by Patrick Chen on 2021/7/6.
//

import SwiftUI

class ImageCache {
    var cache = NSCache<NSURL,UIImage>()
    private static var imageCache = ImageCache()
    
    func get(url: String) -> UIImage? {
        return cache.object(forKey: NSURL(string: url)!)
    }
    
    func set(url: String, image:UIImage) {
        cache.setObject(image, forKey: NSURL(string: url)!)
    }
    
    static func getImageCache() -> ImageCache {
        return imageCache
    }
}
