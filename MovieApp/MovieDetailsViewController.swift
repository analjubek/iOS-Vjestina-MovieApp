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
import SwiftUI

class MovieDetailsViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        rectangle()
        mainInfo()
    }
    
    private func rectangle(){
        let rec = UIView()
        rec.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 80)
        rec.backgroundColor = .systemBlue
        
        view.addSubview(rec)
    }
    
    private func mainInfo(){
        imageGradient()
        userScore()
    }
    
    private func imageGradient() {
        var imageGradientView = UIView()
        
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
        
        imageGradientView.addSubview(movieImageView)
        
        view.addSubview(imageGradientView)
    }
    
    private func userScore(){
        var userScoreView = UIView()
        
        var userScoreLabel = UILabel()
        userScoreLabel.textColor = .white
        userScoreLabel.font = UIFont(name: "Futura", size: 14)
        userScoreLabel.text = "User Score"
        userScoreLabel.frame = CGRect(x: 80, y: 60, width: view.bounds.width, height: 303)
    
        userScoreView.addSubview(userScoreLabel)
        
        var percentageLabel = UILabel()
        percentageLabel.textColor = .white
        percentageLabel.font = UIFont(name: "Futura", size: 15)
        percentageLabel.text = "87%"
        percentageLabel.frame = CGRect(x: 25, y: 60, width: view.bounds.width, height: 303)
        
        userScoreView.addSubview(percentageLabel)
        
        view.addSubview(userScoreView)
    }
    
}

