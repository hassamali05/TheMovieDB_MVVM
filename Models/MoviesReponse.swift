//
//  MoviesReponse.swift
//  TheMovieDB
//
//  Created by Hassam Ali on 4/2/22.
//

import Foundation

struct MoviesReponse: Codable {
    let page: Int
    let results: [Movie]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
