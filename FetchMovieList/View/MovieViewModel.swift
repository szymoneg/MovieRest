//
//  MovieViewModel.swift
//  FetchMovieList
//
//  Created by Szymon Biliński on 25/03/2021.
//

import Foundation

class MovieViewModel {
    private var apiService = ApiService()
    private var popularMovies = [Movie]()
    
    func fetchPopularMovies(completion: @escaping ()->()){
        apiService.getPopularMoviesData{[weak self](result) in
            switch result{
            case.success(let listOf):
                self?.popularMovies = listOf.movies
                completion()
            case .failure(let error):
                print("Error \(error)")
            }
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if popularMovies.count != 0 {
            return popularMovies.count
        }
        return 0
    }
    
    func cellForRowAt(indexPath: IndexPath) ->Movie{
        return popularMovies[indexPath.row]
    }
}
