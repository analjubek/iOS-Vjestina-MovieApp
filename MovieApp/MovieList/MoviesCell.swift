//
//  MoviesCell.swift
//  MovieApp
//
//  Created by Ana Ljubek on 18.04.2022..
//

import UIKit
import SnapKit
import MovieAppData

class MoviesCell: UICollectionViewCell{
    
    private var imageView: UIImageView!
    
    private var movie: MovieModel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViews(){
        layer.cornerRadius = 10
        layer.masksToBounds = true
        
        imageView = UIImageView(image: nil)
        addSubview(imageView)
    }
    
    func set(movie: MovieModel){
        self.movie = movie
        
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
    
    func addConstraints(){
        imageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
