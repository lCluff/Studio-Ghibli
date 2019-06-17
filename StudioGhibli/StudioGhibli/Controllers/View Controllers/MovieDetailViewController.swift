//
//  MovieDetailViewController.swift
//  StudioGhibli
//
//  Created by Leah Cluff on 6/14/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var yearReleasedLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var descriptionView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateViews(movie: Movie) {
        DispatchQueue.main.async {
            self.directorLabel.text = movie.director
           // self.releaseDateLabel.text = movie.releaseDate
            self.titleLabel.text = movie.title
            self.descriptionView.text = movie.description
        }
    }
}
