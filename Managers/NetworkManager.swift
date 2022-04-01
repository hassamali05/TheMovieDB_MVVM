//
//  NetworkManager.swift
//  TheMovieDB
//
//  Created by Hassam Ali on 4/2/22.
//

import Foundation

class NetworkManager {
    
    private let apiKey = "ae304e3f4d3830d95075ae6914b55ddf"
    
    private init() {}
    
    static let shared = NetworkManager()
    
    var baseURL: String {
        return "https://api.themoviedb.org/3/search/movie"
    }
    
    func getMovieURLRequest(for movie: String) -> URLRequest? {
        let components = getURLComponents(with: movie)
        guard let url = components?.url else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        return urlRequest
    }
    
    func getURLComponents(with movieName: String) -> URLComponents? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.themoviedb.org"
        urlComponents.path = "/3/search/movie"
        urlComponents.queryItems = [URLQueryItem(name: "api_key", value: apiKey),
        URLQueryItem(name: "query", value: movieName)]
        return urlComponents
    }
    
    func fetchMovieData(with movieName: String,
                        completion: @escaping (Data) -> Void,
                        failure: @escaping () -> Void) {
        guard let request = getMovieURLRequest(for: movieName) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
            if error != nil {
                failure()
                return
            }
            if let data = data {
                completion(data)
            }
            
        }
        task.resume()
        
    }
}
