//
//  ViewController.swift
//  TheMovieDB
//
//  Created by Hassam Ali on 4/1/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lblNoData: UILabel!
    
    var viewModel: MainViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.searchBar.delegate = self
        self.viewModel = MainViewModel(delegate: self)
        self.lblNoData.isHidden = true
    }
    
    func searchMovie(with movieName: String?) {
        guard let movieName = movieName else {
            return
        }
        viewModel?.fetchMovie(with: movieName)
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        //TODO: try with viewModel?.movies?.totalResults
        return viewModel?.movies?.results?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell",
                                                            for: indexPath) as? MovieCell
        else { return UICollectionViewCell() }
        let item = viewModel?.movies?.results?[indexPath.row]
        cell.upDateUI(title: item?.originalTitle ?? "Nil",
                      description: item?.releaseDate ?? "Nil",
                      image: item?.posterPath ?? "Nil")
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = 120.0
        let padding: CGFloat =  50
        let width = (self.collectionView.frame.width - padding)/2
        return CGSize(width: width, height: height)
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if (searchBar.text?.count ?? 0) > 1 {
            searchMovie(with: searchBar.text)
        }
    }
    
    func searchBar(_ searchBar: UISearchBar,
                   textDidChange searchText: String) {
        if (searchBar.text?.count ?? 0) > 1 {
            searchMovie(with: searchBar.text)
        }
    }
}

extension ViewController: MainViewModelDelegate {
    
    func showDataIfFound(found: Bool) {
        DispatchQueue.main.async {
            self.lblNoData.isHidden = found
            self.collectionView.reloadData()
        }
    }
}
