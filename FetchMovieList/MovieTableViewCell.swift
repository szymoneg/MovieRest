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
        
        
        
    }
    
    private func getImageDataFromURL(url: URL){
        
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
