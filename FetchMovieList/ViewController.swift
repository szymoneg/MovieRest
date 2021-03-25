//
//  ViewController.swift
//  FetchMovieList
//
//  Created by Szymon Biliński on 25/03/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var apiService = ApiService()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        apiService.getPopularMoviesData{ (result) in
            print(result)
        }
    }


}

