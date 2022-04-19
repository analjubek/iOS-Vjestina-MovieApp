//
//  MovieAsListCell.swift
//  MovieApp
//
//  Created by Ana Ljubek on 18.04.2022..
//

import UIKit
import SnapKit
import MovieAppData

class MovieAsListCell: UICollectionViewCell{
    private var movie: MovieModel!
    
    private var mainView: UIView!
    
    private var imageView: UIImageView!
    
    private var textView: UIView!
    private var titleLabel: UILabel!
    private var descriptionLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        buildViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViews(){
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.2
        
        mainView = UIView()
        mainView.layer.cornerRadius = 20
        mainView.backgroundColor = .white
        addSubview(mainView)
        
        imageView = UIImageView(image: nil)
        mainView.addSubview(imageView)
        
        textView = UIView()
        mainView.addSubview(textView)
        
        titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name: "Futura-CondensedExtraBold", size: 16)
        textView.addSubview(titleLabel)
        
        descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 0
        textView.addSubview(descriptionLabel)
    }
    
    func addConstraints(){
        mainView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints{
            $0.top.leading.bottom.equalToSuperview()
            $0.width.equalTo(97)
        }
        
        textView.snp.makeConstraints{
            $0.top.trailing.bottom.equalToSuperview()
            $0.leading.equalTo(imageView.snp.trailing)
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(13)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.trailing.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
        }
    }
    
    func set(movie: MovieModel){
        self.movie = movie
        
        titleLabel.text = movie.title + " (" + String(movie.year) + ")"
        
        descriptionLabel.text = movie.description
        
        let url = URL(string: movie.imageUrl)
        guard let url=url else {
            fatalError()
        }
        if let data = try? Data(contentsOf: url) {
            if let image = UIImage(data: data) {
                    self.imageView.image = image
            }
        }
    }
    
}
