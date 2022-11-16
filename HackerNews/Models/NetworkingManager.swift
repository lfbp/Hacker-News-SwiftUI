//
//  NetworkingManager.swift
//  HackerNews
//
//  Created by lpereira on 16/11/22.
//

import Foundation

class NetworkingManager: ObservableObject {
     @Published var posts: [Post] = []
     func fetchData() {
        guard let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            if error == nil {
                do {
                    let result = try JSONDecoder().decode(PostData.self, from: data!)
                    DispatchQueue.main.async {
                        self.posts = result.hits
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
            
        })
        task.resume()
    }
}
