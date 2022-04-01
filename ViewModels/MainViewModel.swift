//
//  MainModelView.swift
//  TheMovieDB
//
//  Created by Hassam Ali on 4/2/22.
//

import Foundation

protocol MainViewModelDelegate {
    func showDataIfFound(found: Bool)
}

class MainViewModel {
    
    var movies: MoviesReponse?
    var delegate: MainViewModelDelegate
    
    init(delegate: MainViewModelDelegate) {
        self.delegate = delegate
    }
    
    func fetchMovie(with name: String) {
        NetworkManager.shared.fetchMovieData(with: name) {[weak self] data in
            self?.movies = try! JSONDecoder().decode(MoviesReponse.self, from: data)
            self?.delegate.showDataIfFound(found: true)
        } failure: { [weak self] in
            self?.movies = nil
            self?.delegate.showDataIfFound(found: false)
        }
    }
}
