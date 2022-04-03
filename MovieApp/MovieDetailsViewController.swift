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
    
    private var favoriteButtonView: UIView!
    private var favButton: UIButton!
    
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
        
        overview()
    }
    
    private func defineLayoutForViews(){
        topBarConstraints()
        
        imageGradientConstraints()
        userScoreConstraints()
        basicInfoConstraints()
        favoriteButtonConstraints()
    }
    
    private func topBar(){
        topBarView = UIView()
        
        topBarView.backgroundColor = hexStringToUIColor(hex: "#0B253F")
        
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

    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
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
            $0.trailing.equalTo(-340)
            $0.height.equalTo(32)
        }
        favButton.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
    }
    
    
    
    private func overview(){
        description()
        roles()
    }
    
    private func description(){
        var descriptionView = UIView()
        
        var overviewLabel = UILabel()
        overviewLabel.textColor = .black
        overviewLabel.font = UIFont(name: "Futura-CondensedExtraBold", size: 20)
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
    
    private func roles(){
        var rolesView = UIView()
        
        var upStackView = UIStackView()
        upStackView.axis = .horizontal
        upStackView.alignment = .fill
        upStackView.distribution = .fillEqually
        //upStackView.translatesAutoresizingMaskIntoConstraints = false
        upStackView.spacing = 5
        
        var downStackView = UIStackView()
        downStackView.axis = .horizontal
        downStackView.alignment = .fill
        downStackView.distribution = .fillEqually
        //downStackView.translatesAutoresizingMaskIntoConstraints = false
        downStackView.spacing = 5
        
        upStackView.addArrangedSubview(makeRole(name: "Roberto Benigni", job: "Actor", moveX: 0, moveY: 0))
        upStackView.addArrangedSubview(makeRole(name: "Nicoletta Braschi", job: "Actress", moveX: 1, moveY: 0))
        upStackView.addArrangedSubview(makeRole(name: "Giorgio Cantarini", job: "Actor", moveX: 2, moveY: 0))
        
        downStackView.addArrangedSubview(makeRole(name: "Roberto Benigni", job: "Director", moveX: 0, moveY: 1))
        downStackView.addArrangedSubview(makeRole(name: "Vincenzo Cerami", job: "Screenplay", moveX: 1, moveY: 1))
        downStackView.addArrangedSubview(makeRole(name: "Roberto Benigni", job: "Screenplay", moveX: 2, moveY: 1))
        
        rolesView.addSubview(upStackView)
        rolesView.addSubview(downStackView)
        
        rolesView.frame = CGRect(x: 20, y: 300, width: view.bounds.width, height: 600)
        
        view.addSubview(rolesView)
        
    }
    
    private func makeRole(name: String, job: String, moveX: Float, moveY: Float) -> UIView{
        var roleView = UIView()
        
        var nameLabel = UILabel()
        nameLabel.textColor = .black
        nameLabel.font = UIFont(name: "Futura-CondensedExtraBold", size: 14)
        nameLabel.text = name
        nameLabel.frame = CGRect(x: (CGFloat(moveX)*(view.bounds.width/3)), y: CGFloat(moveY)*70, width: view.bounds.width, height: 500)
        
        roleView.addSubview(nameLabel)
        
        var jobLabel = UILabel()
        jobLabel.textColor = .black
        jobLabel.font = UIFont(name: "Futura", size: 14)
        jobLabel.text = job
        jobLabel.frame = CGRect(x: (CGFloat(moveX)*(view.bounds.width/3)), y: CGFloat(moveY)*70, width: view.bounds.width, height: 550)
        
        roleView.addSubview(jobLabel)
        
        /*nameLabel.snp.makeConstraints ({
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-10)
        })
        
        jobLabel.snp.makeConstraints({
            $0.leading.equalTo(nameLabel.snp.leading)
            $0.centerY.equalToSuperview().offset(10)
        })*/
        
        
        return roleView
    }
}

