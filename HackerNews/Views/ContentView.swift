//
//  ContentView.swift
//  HackerNews
//
//  Created by lpereira on 16/11/22.
//

import SwiftUI
struct ContentView: View {
    @ObservedObject var networking = NetworkingManager()
    var body: some View {
        NavigationView {
            List(networking.posts) {
                post in
                NavigationLink(destination: DetailView(urlString: post.url), label: {
                    HStack {
                        Text("\(post.points)")
                        Text(post.title)
                    }
                })
            }.navigationTitle("Hacker News")
        }.onAppear(perform: {
            networking.fetchData()
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
