//
//  MovieTableViewCell.swift
//  FetchMovieList
//
//  Created by Szymon Biliński on 25/03/2021.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

   
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieOverviwe: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    
    private var urlString: String = ""
    
    func setCellWithValuesOf(_ movie: Movie){
        updateUI(title: movie.title, releaseDate: movie.year, rating: movie.rate, overview: movie.overView, poster: movie.posterImage)
    }
    
    private func updateUI(title: String?, releaseDate: String?, rating: Double?, overview: String?, poster: String?){
        self.movieTitle.text = title
        self.movieYear.text = convertDate(releaseDate)
        guard let rate = rating else {return}
        self.movieRating.text = String(rate)
        self.movieOverviwe.text = overview
        
        guard let posterString = poster else {return}
        urlString = "https://image.tmdb.org/t/p/w300" + posterString
        
        guard let posterImageUrl = URL(string: urlString) else {
            self.moviePoster.image = UIImage(named: "default")
            return
        }
        
        self.moviePoster.image = nil
        
        getImageDataFromURL(url: posterImageUrl)
        
    }
    
    private func getImageDataFromURL(url: URL){
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            if let error = error{
                print("Error\(error)")
                return
            }
            
            guard let data = data else {
                print("empyty data")
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data){
                    self.moviePoster.image = image
                }
            }
        }.resume()
    }
    
    func convertDate(_ date: String?) -> String{
        var fixDate = ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let originalDate = date{
            if let newDate = dateFormatter.date(from: originalDate){
                dateFormatter.dateFormat = "dd.MM.yyyy"
                fixDate = dateFormatter.string(from: newDate)
            }
        }
        return fixDate
    }
}
