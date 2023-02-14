//
//  DataModel.swift
//  ReflexionAI Assignment
//
//  Created by Mekala Vamsi Krishna on 12/02/23.
//

import Foundation
import RealmSwift

class Movies: Object, Codable {
    @Persisted var movieList: List<MovieList> = List<MovieList>()

    enum CodingKeys: String, CodingKey {
        case movieList = "Movie List"
    }
}

// MARK: - MovieList
class MovieList: Object, Codable {
    @Persisted var title: String?
    @Persisted var runtime: String?
    @Persisted var year: String?
    @Persisted var moviePoster: String?
    @Persisted var cast: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case runtime = "Runtime"
        case moviePoster = "Movie Poster"
        case cast = "Cast"
    }
}
