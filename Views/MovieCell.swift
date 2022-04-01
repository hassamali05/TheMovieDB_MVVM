//
//  MovieCell.swift
//  TheMovieDB
//
//  Created by Hassam Ali on 4/2/22.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    
    func upDateUI(title: String, description: String, image: String) {
        lbl_title.text = title
        lblDescription.text = description
    }
}
