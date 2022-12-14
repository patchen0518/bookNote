//
//  WebView.swift
//  BookNotes
//
//  Created by Patrick Chen on 2021/7/2.
//

import SwiftUI

struct WebView: View {
    
    let url: String?
    
    var body: some View {
        WebStruct(urlString: url)
            .navigationBarTitleDisplayMode(.automatic)
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(url: "https://www.amazon.com/dp/1501171348?tag=NYTBSREV-20")
    }
}
