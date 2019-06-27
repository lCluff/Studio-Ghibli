//
//  Movie.swift
//  StudioGhibli
//
//  Created by Leah Cluff on 6/14/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import Foundation
import UIKit

struct Movie: Codable {
    
    var title: String
    var director: String
    var description: String
    var releaseDate: String

    enum CodingKeys:String, CodingKey {
        case releaseDate = "release_date"
        case title = "title"
        case director = "director"
        case description = "description"
    }
}
struct TopLevelJSON: Codable {
    var JSON: [Movie]
}

extension Movie {
    class ImageNames {
        var imageName: UIImage
        init(imageName: UIImage) {
            self.imageName = imageName
        }
    }
}
