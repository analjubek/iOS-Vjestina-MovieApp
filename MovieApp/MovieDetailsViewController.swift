//
//  MovieDetailsViewController.swift
//  MovieApp
//
//  Created by Ana Ljubek on 30.03.2022..
//

import Foundation
import UIKit
import SnapKit
import SwiftUI

class MovieDetailsViewController: UIViewController{
    //topBar
    private var topBarView: UIView!
    private var logoImageView: UIImageView!
    
    
    //imageGradient
    private var imageGradientView: UIView!
    private var movieImageView: UIImageView!
    
    //userScore
    private var userScoreView: UIView!
    private var percentageButtonView: UIView!
    private var percentageLabel: UILabel!
    private var userScoreLabel: UILabel!
    
    //basicInfo
    private var basicInfoView: UIView!
    private var titleLabel: UILabel!
    private var dateLabel: UILabel!
    private var genreLabel: UILabel!
    
    //favoriteButton
    private var favoriteButtonView: UIView!
    private var favButton: UIButton!
    
    
    //description
    private var descriptionView: UIView!
    private var overviewLabel: UILabel!
    private var desriptionLabel: UILabel!
    
    //roles
    private var rolesView: UIView!
    private var upStackView: UIStackView!
    private var downStackView: UIStackView!
    
    private var roleView: UIView!
    private var nameLabel: UILabel!
    private var jobLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        viewsFunc()
        defineLayoutForViews()
    }
    
    private func viewsFunc(){
        topBar()
        
        imageGradient()
        userScore()
        basicInfo()
        favoriteButton()
        
        description()
        roles()
    }
    
    private func defineLayoutForViews(){
        topBarConstraints()
        
        imageGradientConstraints()
        userScoreConstraints()
        basicInfoConstraints()
        favoriteButtonConstraints()
        
        descriptionConstraints()
        rolesConstraints()
    }
    
    
    
    private func topBar(){
        topBarView = UIView()
        
        topBarView.backgroundColor = UIColor.hexStringToUIColor(hex: "#0B253F")
        //hexStringToUIColor(hex: "#0B253F")
        
        let logoImage = UIImage(named: "logo")
        logoImageView = UIImageView(image: logoImage)
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.clipsToBounds = true
        
        topBarView.addSubview(logoImageView)
        
        view.addSubview(topBarView)
    }
    
    private func topBarConstraints(){
        topBarView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(80)
        }
        
        logoImageView.snp.makeConstraints{
            $0.centerX.equalTo(topBarView)
            $0.bottom.equalTo(topBarView).inset(7)
            $0.height.equalTo(35)
            $0.width.equalTo(143)
        }
    }

    private func imageGradient() {
        imageGradientView = UIView()
        
        let movieImage = UIImage(named: "LifeIsBeautiful")
        movieImageView = UIImageView(image: movieImage)
        movieImageView.contentMode = .scaleAspectFill
        movieImageView.clipsToBounds = true
        movieImageView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 303)
        
        let gradient = CAGradientLayer()
        gradient.frame = movieImageView.bounds
        let startColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        let endColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        gradient.colors = [startColor, endColor]
        movieImageView.layer.insertSublayer(gradient, at: 0)
        
        imageGradientView.addSubview(movieImageView)
        
        view.addSubview(imageGradientView)
    }
    
    private func imageGradientConstraints(){
        imageGradientView.snp.makeConstraints{
            $0.top.equalTo(topBarView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(303)
        }
    }
    
    private func userScore(){
        userScoreView = UIView()
        
        userScoreView.backgroundColor = .none
        
        percentageButtonView = UIView()
        percentageButtonView.backgroundColor = .systemGreen
        percentageButtonView.layer.cornerRadius = 21
        percentageButtonView.frame = CGRect (x: 21, y: 108, width: 42, height: 42)
        
        userScoreView.addSubview(percentageButtonView)
        
        percentageLabel = UILabel()
        percentageLabel.textColor = .white
        percentageLabel.font = UIFont(name: "Futura-CondensedExtraBold", size: 15)
        percentageLabel.text = "87%"
        percentageLabel.frame = CGRect(x: 8, y: 0, width: 42, height: 42)
        
        percentageButtonView.addSubview(percentageLabel)
        
        userScoreLabel = UILabel()
        userScoreLabel.textColor = .white
        userScoreLabel.font = UIFont(name: "Futura-CondensedExtraBold", size: 14)
        userScoreLabel.text = "User Score"
        userScoreLabel.frame = CGRect(x: 71, y: -21, width: view.bounds.width, height: 303)
        
        userScoreView.addSubview(percentageButtonView)
        userScoreView.addSubview(userScoreLabel)
        
        view.addSubview(userScoreView)
    }
    
    private func userScoreConstraints(){
        userScoreView.snp.makeConstraints {
            $0.top.equalTo(topBarView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(303)
        }
        /*percentageButtonView.snp.makeConstraints{
            $0.top.equalTo(topBarView.snp.bottom).inset(108)
            $0.leading.equalToSuperview()
        }
        percentageLabel.snp.makeConstraints{
            $0.top.equalTo(topBarView.snp.bottom).inset(121)
            $0.leading.equalToSuperview().inset(31)
        }
        userScoreLabel.snp.makeConstraints{
            $0.top.equalTo(topBarView.snp.bottom).inset(122)
            $0.leading.equalToSuperview().inset(71)
        }*/
    }
    
    private func basicInfo(){
        basicInfoView = UIView()
        
        userScoreView.backgroundColor = .none
        
        titleLabel = UILabel()
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "Futura-CondensedExtraBold", size: 24)
        titleLabel.text = "Life Is Beautiful (1997)"
        titleLabel.frame = CGRect(x: 18, y: 30, width: view.bounds.width, height: 303)
        
        basicInfoView.addSubview(titleLabel)
        
        dateLabel = UILabel()
        dateLabel.textColor = .white
        dateLabel.font = UIFont(name: "Futura", size: 14)
        dateLabel.text = "20/12/1997 (Italy)"
        dateLabel.frame = CGRect(x: 18, y: 60, width: view.bounds.width, height: 303)
        
        basicInfoView.addSubview(dateLabel)
        
        genreLabel = UILabel()
        genreLabel.textColor = .white
        genreLabel.font = UIFont(name: "Futura", size: 14)
        genreLabel.text = "Comedy, Drama, Romance 1h 56m"
        genreLabel.frame = CGRect(x: 18, y: 80, width: view.bounds.width, height: 303)
        
        basicInfoView.addSubview(genreLabel)
        
        view.addSubview(basicInfoView)
    }
    private func basicInfoConstraints(){
        basicInfoView.snp.makeConstraints {
            $0.top.equalTo(topBarView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(303)
        }/*
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(topBarView.snp.bottom).inset(159)
            $0.leading.equalToSuperview().inset(18)
        }
         dateLabel.snp.makeConstraints{
            $0.top.equalTo(topBarView.snp.bottom).inset(196)
            $0.leading.equalToSuperview().inset(18)
        }
         genreLabel.snp.makeConstraints{
            $0.top.equalTo(topBarView.snp.bottom).inset(122-(40/2))
            $0.leading.equalToSuperview().inset(18)
        }*/
    }
    private func favoriteButton(){
        favoriteButtonView = UIView()
        
        favoriteButtonView.backgroundColor = .gray
        favoriteButtonView.layer.cornerRadius = 16
        favoriteButtonView.frame = CGRect (x: 0, y: 0, width: 32, height: 32)
        
        favButton = UIButton()
        favButton.setImage(UIImage(systemName: "star"), for: .normal)
        favButton.tintColor = .white
        favButton.frame = CGRect (x: 0, y: 0, width: 14, height: 13)
        
        favoriteButtonView.addSubview(favButton)
        
        view.addSubview(favoriteButtonView)

    }
    private func favoriteButtonConstraints(){
        favoriteButtonView.snp.makeConstraints {
            $0.top.equalTo(330)
            $0.leading.equalTo(18)
            $0.width.equalTo(32)
            $0.height.equalTo(32)
        }
        favButton.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
    }

    
    
    private func description(){
        descriptionView = UIView()
        
        descriptionView.backgroundColor = .white
        
        overviewLabel = UILabel()
        overviewLabel.textColor = .black
        overviewLabel.font = UIFont(name: "Futura-CondensedExtraBold", size: 20)
        overviewLabel.text = "Overview"
        
        descriptionView.addSubview(overviewLabel)
        
        desriptionLabel = UILabel()
        desriptionLabel.textColor = .black
        desriptionLabel.font = UIFont(name: "Futura", size: 14)
        desriptionLabel.text = "When an open-minded Jewish waiter and his son become victims of the Holocaust, he uses a perfect mixture of will, humor, and imagination to protect his son from the dangers around their camp."
        desriptionLabel.numberOfLines = 0
        
        descriptionView.addSubview(desriptionLabel)
        
        view.addSubview(descriptionView)
    }
    
    private func descriptionConstraints(){
        descriptionView.snp.makeConstraints{
            $0.top.equalTo(imageGradientView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        overviewLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(20)
            $0.leading.trailing.equalTo(18)
        }
        desriptionLabel.snp.makeConstraints{
            $0.top.equalTo(overviewLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalTo(18)
        }
    }
    
    private func roles(){
        rolesView = UIView()
        
        upStackView = UIStackView()
        upStackView.axis = .horizontal
        upStackView.alignment = .fill
        upStackView.distribution = .fillEqually
        upStackView.spacing = 5
        
        downStackView = UIStackView()
        downStackView.axis = .horizontal
        downStackView.alignment = .fill
        downStackView.distribution = .fillEqually
        downStackView.spacing = 5
        
        upStackView.addArrangedSubview(makeRole(name: "Roberto Benigni", job: "Actor"))
        upStackView.addArrangedSubview(makeRole(name: "Nicoletta Braschi", job: "Actress"))
        upStackView.addArrangedSubview(makeRole(name: "Giorgio Cantarini", job: "Actor"))
        
        downStackView.addArrangedSubview(makeRole(name: "Roberto Benigni", job: "Director"))
        downStackView.addArrangedSubview(makeRole(name: "Vincenzo Cerami", job: "Screenplay"))
        downStackView.addArrangedSubview(makeRole(name: "Roberto Benigni", job: "Screenplay"))
        
        rolesView.addSubview(upStackView)
        rolesView.addSubview(downStackView)
        
        rolesView.frame = CGRect(x: 20, y: 300, width: view.bounds.width, height: 600)
        
        view.addSubview(rolesView)
        
    }
    
    private func rolesConstraints(){
        rolesView.snp.makeConstraints{
            $0.top.equalTo(desriptionLabel.snp.bottom).offset(22)
            $0.leading.trailing.equalToSuperview()
        }
        upStackView.snp.makeConstraints{
            $0.top.equalTo(desriptionLabel.snp.bottom).offset(22)
            $0.leading.trailing.equalTo(18)
            $0.height.equalTo(40)
        }
        downStackView.snp.makeConstraints{
            $0.top.equalTo(upStackView.snp.bottom).offset(26)
            $0.leading.trailing.equalTo(18)
            $0.height.equalTo(40)
        }
    }
    
    private func makeRole(name: String, job: String) -> UIView{
        roleView = UIView()
        
        nameLabel = UILabel()
        nameLabel.textColor = .black
        nameLabel.font = UIFont(name: "Futura-CondensedExtraBold", size: 14)
        nameLabel.text = name
        
        roleView.addSubview(nameLabel)
        
        jobLabel = UILabel()
        jobLabel.textColor = .black
        jobLabel.font = UIFont(name: "Futura", size: 14)
        jobLabel.text = job
        
        roleView.addSubview(jobLabel)
        
        nameLabel.snp.makeConstraints ({
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-10)
        })
        
        jobLabel.snp.makeConstraints({
            $0.leading.equalTo(nameLabel.snp.leading)
            $0.centerY.equalToSuperview().offset(10)
        })
        
        
        return roleView
    }
}
