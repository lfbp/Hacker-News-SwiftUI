//
//  DetailView.swift
//  HackerNews
//
//  Created by lpereira on 16/11/22.
//

import SwiftUI
import WebKit

struct DetailView: View {
    let urlString: String?
    var body: some View {
        WebView(urlString: urlString)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(urlString: "https://www.google.com/?client=safari")
    }
}

struct WebView: UIViewRepresentable {
    typealias UIViewType = WKWebView
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let urlString = urlString {
            if let url = URL(string: urlString) {
                let resquest = URLRequest(url: url)
                uiView.load(resquest)
            }
        }
    }
    
}
