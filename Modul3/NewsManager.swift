//
//  NewsManager.swift
//  Modul3
//
//  Created by Юрий Кузнецов on 05.03.2024.
// https://newsapi.org/v2/everything?q=tesla&from=2024-02-05&sortBy=publishedAt&apiKey=376fa58fff91487d80f02d020b62a3a1

import Foundation

class NewsManager {
    
    func getNews(){
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "newsapi.org"
        urlComponents.path = "/v2/everything"
        
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: "dropshipping"),
            URLQueryItem(name: "apiKey", value: "376fa58fff91487d80f02d020b62a3a1"),
            URLQueryItem(name: "language", value: "en"),
            URLQueryItem(name: "pageSize", value: "20"),
        ]
        
        guard let url = urlComponents.url else { return }
        let req = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: req) { Data, _, err in
            guard err == nil else {
                print(err!.localizedDescription)
                return
            }
            
            if let jsonData = Data{
                let res = try? JSONDecoder().decode(Response.self, from: jsonData)
                print(res)
            }
            
        }.resume()
    }
    
    struct Response: Decodable {
        let status: String
        let totalResults: Int
    }
    
    
    
}
