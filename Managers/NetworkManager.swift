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
    
    enum Headers {
        case movieData
        case image
    }
    
    func fetchMovieData<T: Codable>(with movieName: String,
                                    completion: @escaping (T) -> Void) {
        
    }
    
    func fetchMovieImage(with urlString: String,
                         completion: @escaping () -> Void) {
        
    }
}
