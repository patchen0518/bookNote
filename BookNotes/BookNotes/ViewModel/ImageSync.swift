//
//  ImageSync.swift
//  BookNotes
//
//  Created by Patrick Chen on 2021/7/5.
//

import SwiftUI

struct ImageSync: View {
    
    @ObservedObject var imageLoader:ImageFetcher
    
    init(withURL url:String) {
        imageLoader = ImageFetcher(urlString:url)
    }
    
    var body: some View {
        
        Image(uiImage: imageLoader.image ?? UIImage())
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 250)
            .cornerRadius(15)
    }
}

//struct ImageSync_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageSync()
//    }
//}
