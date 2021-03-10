//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by DOUG UNO on 3/6/21.
//

import Foundation

class NetworkManager {
    
    let urlString: String = "https://hn.algolia.com/api/v1/search?tags=front_page"
    var posts = [Post]()
    var delegate: ViewControllerDelegate?
    
    func fetchData() {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                            self.posts = results.hits
                            self.delegate?.didFinishUpdates()
                            }
                        } catch {
                            print(error)
                        }
                    }
                    }
                }
            task.resume()
            }
        }
}
