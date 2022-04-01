//
//  MainModelView.swift
//  TheMovieDB
//
//  Created by Hassam Ali on 4/2/22.
//

import Foundation

protocol MainViewModelDelegate {
    func updateUI()
}

class MainViewModel {
    
    var movies: MoviesReponse?
    var delegate: MainViewModelDelegate
    
    init(delegate: MainViewModelDelegate) {
        self.delegate = delegate
    }
    
    func fetchMovie(with name: String) {
        
    }
}
