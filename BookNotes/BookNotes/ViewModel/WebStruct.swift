//
//  WebStruct.swift
//  BookNotes
//
//  Created by Patrick Chen on 2021/7/2.
//

import SwiftUI
import WebKit

struct WebStruct: UIViewRepresentable {
    typealias UIViewType = WKWebView
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeURL = urlString {
            if let url = URL(string: safeURL) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
    
}

//struct WebStruct_Previews: PreviewProvider {
//    static var previews: some View {
//        WebStruct()
//    }
//}
