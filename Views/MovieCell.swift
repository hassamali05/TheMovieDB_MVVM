//
//  MovieCell.swift
//  TheMovieDB
//
//  Created by Hassam Ali on 4/2/22.
//

import UIKit
import SDWebImage

class MovieCell: UICollectionViewCell {
    
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    
    func upDateUI(title: String, description: String, image: String) {
        lbl_title.text = title
        let imageURL = NetworkManager.shared.imageURL + image
        if let url = URL(string: imageURL) {
            posterImage.sd_setImage(with: url, placeholderImage: UIImage(named: "dummyImage"))
        }
    }
}
