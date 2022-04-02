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
        return "api.themoviedb.org"
    }
    
    var imageURL: String {
        return "https://image.tmdb.org/t/p/w220_and_h330_face"
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
        urlComponents.host = baseURL
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
//                self.printResponse(data: data)
                completion(data)
            }
            
        }
        task.resume()
        
    }
    
    func printResponse(data: Data) {
        do {
            let parsedData = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
            print(parsedData)
        } catch {
            print("Couldn't parse")
        }
    }
}
