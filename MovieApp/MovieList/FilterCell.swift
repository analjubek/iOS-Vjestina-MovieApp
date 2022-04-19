//
//  FilterCell.swift
//  MovieApp
//
//  Created by Ana Ljubek on 18.04.2022..
//

import UIKit
import SnapKit
import MovieAppData

class FilterCell: UIView{
    private var filter: MovieFilter!
    
    private var mainView: UIView!
    
    private var filterLabel: UILabel!
    private var filterUnderline: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViews(){
        mainView = UIView()
        addSubview(mainView)
        
        filterLabel = UILabel()
        filterLabel.textColor = .hexStringToUIColor(hex: "#0B253F")
        filterLabel.font = UIFont(name: "Futura", size: 16)
        mainView.addSubview(filterLabel)
        
        filterUnderline = UIView()
        filterUnderline.backgroundColor = UIColor.hexStringToUIColor(hex: "#0B253F")
        mainView.addSubview(filterUnderline)
    }
    
    func addConstraints(){
        mainView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            $0.height.equalTo(30)
        }
        
        filterLabel.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(22)
        }
        
        filterUnderline.snp.makeConstraints{
            $0.top.equalTo(filterLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(3)
        }
    }
    
    
    func filterToString(filter: MovieFilter) -> String{
        switch filter {
            case .streaming:
                return "Streaming"
            case .onTv:
                return "On TV"
            case .forRent:
                return "For Rent"
            case .inTheaters:
                return "In Theaters"
                
            case .thriller:
                return "Thriller"
            case .horror:
                return "Horror"
            case .comedy:
                return "Comedy"
            case .romanticComedy:
                return "Romantic Comedy"
            case .sport:
                return "Sport"
            case .action:
                return "Action"
            case .sciFi:
                return "SciFi"
            case .war:
                return "War"
            case .drama:
                return "Drama"
                
            case .day:
                return "Day"
            case .week:
                return "Week"
            case .month:
                return "Month"
            case .allTime:
                return "All Time"
        }
    }
}
