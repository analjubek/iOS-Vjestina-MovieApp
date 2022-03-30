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
        overview()
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
        basicInfo()
        favoriteButton()
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
        
        var percentageButtonView = UIView()
        
        percentageButtonView.backgroundColor = .systemGreen
        percentageButtonView.layer.cornerRadius = 21
        percentageButtonView.frame = CGRect (x: 20, y: 180, width: 42, height: 42)
        
        var percentageLabel = UILabel()
        percentageLabel.textColor = .white
        percentageLabel.font = UIFont(name: "Futura", size: 15)
        percentageLabel.text = "87%"
        percentageLabel.frame = CGRect(x: 7, y: -130, width: view.bounds.width, height: 303)
        
        percentageButtonView.addSubview(percentageLabel)
        
        var userScoreLabel = UILabel()
        userScoreLabel.textColor = .white
        userScoreLabel.font = UIFont(name: "Futura", size: 14)
        userScoreLabel.text = "User Score"
        userScoreLabel.frame = CGRect(x: 70, y: 52, width: view.bounds.width, height: 303)
        
        userScoreView.addSubview(percentageButtonView)
        userScoreView.addSubview(userScoreLabel)
        
        view.addSubview(userScoreView)
    }
    
    private func basicInfo(){
        var basicInfoView = UIView()
        
        var titleLabel = UILabel()
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "Futura", size: 24)
        titleLabel.text = "Life Is Beautiful (1997)"
        titleLabel.frame = CGRect(x: 20, y: 90, width: view.bounds.width, height: 303)
        
        basicInfoView.addSubview(titleLabel)
        
        var dateLabel = UILabel()
        dateLabel.textColor = .white
        dateLabel.font = UIFont(name: "Futura", size: 14)
        dateLabel.text = "20/12/1997 (Italy)"
        dateLabel.frame = CGRect(x: 20, y: 120, width: view.bounds.width, height: 303)
        
        basicInfoView.addSubview(dateLabel)
        
        var genreLabel = UILabel()
        genreLabel.textColor = .white
        genreLabel.font = UIFont(name: "Futura", size: 14)
        genreLabel.text = "Comedy, Drama, Romance 1h 56m"
        genreLabel.frame = CGRect(x: 20, y: 140, width: view.bounds.width, height: 303)
        
        basicInfoView.addSubview(genreLabel)
        
        view.addSubview(basicInfoView)
    }
    private func favoriteButton(){
        var favoriteButtonView = UIView()
        
        favoriteButtonView.backgroundColor = .gray
        favoriteButtonView.layer.cornerRadius = 16
        favoriteButtonView.frame = CGRect (x: 20, y: 310, width: 32, height: 32)
        
        var favButton = UIButton()
        favButton.setImage(UIImage(systemName: "star"), for: .normal)
        favButton.tintColor = .white
        favButton.frame = CGRect (x: 0, y: 0, width: 32, height: 32)
        
        favoriteButtonView.addSubview(favButton)
        
        view.addSubview(favoriteButtonView)
    }
    
    private func overview(){
        description()
    }
    
    private func description(){
        var descriptionView = UIView()
        
        var overviewLabel = UILabel()
        overviewLabel.textColor = .black
        overviewLabel.font = UIFont(name: "Futura", size: 20)
        overviewLabel.text = "Overview"
        overviewLabel.frame = CGRect(x: 20, y: 260, width: view.bounds.width, height: 303)
        
        descriptionView.addSubview(overviewLabel)
        
        var desriptionLabel = UILabel()
        desriptionLabel.textColor = .black
        desriptionLabel.font = UIFont(name: "Futura", size: 14)
        desriptionLabel.text = "When an open-minded Jewish waiter and his son become victims of the Holocaust, he uses a perfect mixture of will, humor, and imagination to protect his son from the dangers around their camp."
        desriptionLabel.frame = CGRect(x: 20, y: 320, width: view.bounds.width, height: 303)
        desriptionLabel.numberOfLines = 0
        
        descriptionView.addSubview(desriptionLabel)
        
        view.addSubview(descriptionView)
    }
}

