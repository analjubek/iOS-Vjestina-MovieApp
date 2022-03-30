//
//  MovieDetailsViewController.swift
//  MovieApp
//
//  Created by Ana Ljubek on 30.03.2022..
//

import Foundation
import UIKit
import PureLayout
import SnapKit

class MovieDetailsViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        mainInfo()
    }
    
    private func rectangle(){
        let rec = UIView()
        rec.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 80)
        
        view.addSubview(rec)
    }
    
    private func mainInfo(){
        let movieImage = UIImage(named: "LifeIsBeautiful")
        let movieImageView = UIImageView(image: movieImage)
        movieImageView.contentMode = .scaleAspectFill
        movieImageView.clipsToBounds = true
        movieImageView.frame = CGRect(x: 0, y: 80, width: view.bounds.width, height: 303)
        
        let gradient = CAGradientLayer()
        gradient.frame = movieImageView.bounds
        let startColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        let endColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        gradient.colors = [startColor, endColor]
        movieImageView.layer.insertSublayer(gradient, at: 0)
         
        view.addSubview(movieImageView)
    }
}

