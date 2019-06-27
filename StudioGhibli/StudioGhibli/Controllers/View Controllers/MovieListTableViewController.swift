//
//  MovieListTableViewController.swift
//  StudioGhibli
//
//  Created by Leah Cluff on 6/14/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    // MAR
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        MovieController.sharedInstance.fetchMovies(searchTerm: "") { (characters) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    //MARK: TableView Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MovieController.sharedInstance.movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        let thisCellsMovie = MovieController.sharedInstance.movies[indexPath.row]
        cell.textLabel?.text = thisCellsMovie.title
        return cell
    }

    // MARK: - Navigation
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toExistingVC" {
            if let detailViewController = segue.destination as? MovieDetailViewController, let selectedRow = tableView.indexPathForSelectedRow?.row {
              let movie = MovieController.sharedInstance.movies[selectedRow]
                //another break in code
                detailViewController.self.updateViews(movie: Movie) = movie
            }
        }
    }
}
