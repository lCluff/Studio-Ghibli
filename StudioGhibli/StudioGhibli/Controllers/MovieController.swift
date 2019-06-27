//
//  MovieController.swift
//  StudioGhibli
//
//  Created by Leah Cluff on 6/14/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import Foundation
import UIKit

class MovieController {
    
    static let sharedInstance = MovieController()
    
    var movies: [Movie] = []
    
    //MARK: - Functions
    func fetchMovies(searchTerm: String, completion: @escaping([Movie]?) -> Void) {
        guard let baseURL = URL(string: "https://ghibliapi.herokuapp.com") else {return}
        let movieComponent = baseURL.appendingPathComponent("films")
        let finalURL = movieComponent.appendingPathComponent(searchTerm)
        print(finalURL)
        
        //MARK: - URL Build
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            //check if there is an error
            if let error = error {
                print("There was an error~! \(error)")
            }
            //check for data
            if let data = data {
                do {
                    // decode the data
                    let movies = try JSONDecoder().decode([Movie].self, from: data)
                    completion(movies) //the code breaks here why???
                } catch {
                    print("error fetching the movies")
                    completion(nil);return
                }
            }
        }.resume()
     }
}
